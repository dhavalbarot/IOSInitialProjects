//
//  Weather.h
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"

@interface Weather : NSObject

@property (nonatomic,strong) NSString *cityId;
@property (nonatomic) double humidity;
@property (nonatomic) double pressure;
@property (nonatomic) double minTemp;
@property (nonatomic) double maxTemp;
@property (nonatomic) double temp;
@property (nonatomic,strong) NSString *country;
@property (nonatomic,strong) NSString *cityName;
@property (nonatomic,strong) NSString *weatherDesc;
@property (nonatomic) double windSpeed;
@property (nonatomic,strong) Coord *coordinates;

-(id)initWithNSDictionary:(NSDictionary *)jsonData;

@end
