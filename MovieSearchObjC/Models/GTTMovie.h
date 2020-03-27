//
//  GTTMovie.h
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTTMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) double rating;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, copy, nullable) NSString *posterPath;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
