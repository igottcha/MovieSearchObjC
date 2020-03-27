//
//  GTTMovie.m
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import "GTTMovie.h"

@implementation GTTMovie

-(instancetype) initWithTitle: (NSString *)title rating: (double)rating overview: (NSString *)overview posterPath: (nullable NSString *)posterPath
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
        _posterPath = posterPath;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    double rating = [dictionary[@"vote_average"] doubleValue];
    NSString *overview = dictionary[@"overview"];
    NSString * _Nullable posterPath = dictionary[@"poster_path"];
    
    return [self initWithTitle:title rating:rating overview:overview posterPath:posterPath];
}

@end
