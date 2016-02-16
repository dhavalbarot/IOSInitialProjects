//
//  WeatherDetailViewController.h
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherDetailViewController : UIViewController

@property Weather *weather;

@property (strong, nonatomic) IBOutlet UILabel *lblCityName;
@property (strong, nonatomic) IBOutlet UILabel *lblCountry;

@property (strong, nonatomic) IBOutlet UILabel *lblCoordinates;


@property (strong, nonatomic) IBOutlet UILabel *lblTemperature;
@property (strong, nonatomic) IBOutlet UILabel *lblMaxTemperature;
@property (strong, nonatomic) IBOutlet UILabel *lblMinTemperature;

@property (strong, nonatomic) IBOutlet UILabel *lblHumidity;
@property (strong, nonatomic) IBOutlet UILabel *lblPressure;

@property (strong, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@end
