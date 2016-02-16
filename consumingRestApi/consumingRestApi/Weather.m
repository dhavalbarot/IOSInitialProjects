//
//  Weather.m
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "Weather.h"
#import "Coord.h"

@implementation Weather

-(id)initWithNSDictionary:(NSDictionary *)jsonData
{
    self = [super init];
    if (self)
    {
        //Fetching coordinates from weather info
        _coordinates = [[Coord alloc] initWithCoordinateDictionary:[jsonData objectForKey:@"coord"]];
        _cityId = [[jsonData objectForKey:@"id"] stringValue];
        _humidity = [[[jsonData objectForKey:@"main"] objectForKey:@"humidity"] floatValue];
        _pressure = [[[jsonData objectForKey:@"main"] objectForKey:@"pressure"] floatValue];
        _minTemp = [[[jsonData objectForKey:@"main"] objectForKey:@"temp_min"] floatValue];
        _maxTemp = [[[jsonData objectForKey:@"main"] objectForKey:@"temp_max"] floatValue];
        _temp = [[[jsonData objectForKey:@"main"] objectForKey:@"temp"] floatValue];
        _country = [[jsonData objectForKey:@"sys"] objectForKey:@"country"] ;
        _cityName = [jsonData objectForKey:@"name"];
        _weatherDesc = [[[jsonData objectForKey:@"weather"] objectAtIndex:0] objectForKey:@"description"];
        _windSpeed = [[[jsonData objectForKey:@"wind"] objectForKey:@"speed"] floatValue];
    }
    return  self;
}

@end
