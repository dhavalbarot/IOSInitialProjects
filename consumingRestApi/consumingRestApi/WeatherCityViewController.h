//
//  WeatherCityViewController.h
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCityViewController : UIViewController

//Properties
@property (strong, nonatomic) IBOutlet UITextField *txtCityName;

//Methods
- (IBAction)getWeatherInfoByCityName;
- (IBAction)getWeatherDetailByCityName:(id)sender;

@end
