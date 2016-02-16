//
//  Coord.h
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coord : NSObject

@property (nonatomic) double latitude;
@property (nonatomic) double longtitude;

-(id)initWithCoordinateDictionary:(NSDictionary *) coordinate;

@end
