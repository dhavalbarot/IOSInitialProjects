//
//  Coord.m
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "Coord.h"

@implementation Coord


-(id)initWithCoordinateDictionary:(NSDictionary *) coordinate
{
    self = [super init];
    
    if(self)
    {
        self.latitude = [[coordinate objectForKey:@"lat"] floatValue];
        self.longtitude = [[coordinate objectForKey:@"lon"] floatValue];
    }
    
    return self;
}

@end
