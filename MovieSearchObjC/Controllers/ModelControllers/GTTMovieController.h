//
//  GTTMovieController.h
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTTMovie;
@interface GTTMovieController : NSObject

+(void)fetchMovie: (NSString *)searchTerm completion: (void(^)(NSArray<GTTMovie *> * _Nullable))completion;
+(void)fetchPosterImage: (GTTMovie *)movie completion: (void(^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
