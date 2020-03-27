//
//  GTTMovieController.m
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTMovieController.h"
#import "GTTMovie.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie";
static NSString * const baseImageString = @"https://image.tmdb.org/t/p/w500";
static NSString * const apiKey = @"77067d8899800d1a6a1e48b3b0fa1854";
static NSString * const language = @"en-US";
static NSString * const includeAdult = @"false";

@implementation GTTMovieController

- (void)fetchMovie:(NSString *)searchTerm completion:(void (^)(NSArray<GTTMovie *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURL];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    components.queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:apiKey],
                              [NSURLQueryItem queryItemWithName:@"language" value:language],
                              [NSURLQueryItem queryItemWithName:@"query" value:searchTerm.lowercaseString],
                              [NSURLQueryItem queryItemWithName:@"adult" value:includeAdult]];
    NSURL *finalURL = [components URL];
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *movieDictionaryArray = topLevelObject[@"results"];
        NSMutableArray<GTTMovie *> *movies = [NSMutableArray new];
        
        for (NSDictionary *movieDictionary in movieDictionaryArray)
        {
            GTTMovie * movie = [[GTTMovie alloc] initWithDictionary:movieDictionary];
            [movies addObject:movie];
        }
        completion(movies);
        
    }] resume];
}

- (void)fetchPosterImage:(GTTMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    NSString *imageURLString = [NSString stringWithFormat:@"%@ %@", baseImageString, [movie posterPath]];
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}

@end
