//
//  WeatherDetailViewController.m
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _lblCityName.text = _weather.cityName;
    _lblCountry.text = _weather.country;
    
    NSString *longLat = [NSString stringWithFormat:@"Latitude: %.2f, Longitude: %.2f", _weather.coordinates.latitude, _weather.coordinates.longtitude];
    _lblCoordinates.text = longLat;
    
    _lblTemperature.text = [NSString stringWithFormat:@"%.2f ℉", _weather.temp];
    _lblMinTemperature.text = [NSString stringWithFormat:@"%.2f ℉", _weather.minTemp];
    _lblMaxTemperature.text = [NSString stringWithFormat:@"%.2f ℉", _weather.maxTemp];
    
    _lblHumidity.text = [NSString stringWithFormat:@"%.2f", _weather.humidity];
    _lblPressure.text = [NSString stringWithFormat:@"%.2f", _weather.pressure];
    
    NSString *wind = [NSString stringWithFormat:@"Wind Speed : %.2f m/s", _weather.windSpeed];
    _lblWindSpeed.text = wind;
    
    _lblDescription.text = _weather.weatherDesc;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
