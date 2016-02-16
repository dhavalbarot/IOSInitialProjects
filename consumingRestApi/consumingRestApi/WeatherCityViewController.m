//
//  WeatherCityViewController.m
//  consumingRestApi
//
//  Created by Dhaval Barot on 08/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "WeatherCityViewController.h"
#import "Coord.h"
#import "Weather.h"
#import "WeatherDetailViewController.h"


@interface WeatherCityViewController ()

@property (nonatomic,strong) Weather *weather;
@property (nonatomic) BOOL isWeatherReadyForSegue;
@end

@implementation WeatherCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData];
    _isWeatherReadyForSegue = false;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Call the Api using CityName and get the JSON object and parse it
- (IBAction)getWeatherDetailByCityName:(id)sender {
    if([_txtCityName.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Attention" message:@"Enter City Name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        NSString *cityName = _txtCityName.text;
        
        NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=44db6a862fba0b067b1930da0d769e98", cityName];
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             if(data.length > 0 && connectionError == nil)
             {
                 NSLog(@"Data");
                 NSDictionary *weatherDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                 
                 _weather = [[Weather alloc] initWithNSDictionary:weatherDict];
                 
                 _isWeatherReadyForSegue = true;
                 [self performSegueWithIdentifier:@"viewDetails" sender:self];
                 
                // WeatherDetailViewController *weatherDetail = [[WeatherDetailViewController alloc] initWithNibName:@"WeatherDetailViewController" bundle:nil];
                //WeatherDetailViewController *weatherDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailTableView"]
                // weatherDetail.weather = _weather;

                 //[self pushViewController:weatherDetail animated:YES];
             }
             
             
         }];
        
        
    }

}

-(void)fetchData
{
    NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if(data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             NSString *str = [[greeting objectForKey:@"id"] stringValue];
             //self.lblGreetingMsg.text = [greeting objectForKey:@"content"];
         }
     }];

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return _isWeatherReadyForSegue;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WeatherDetailViewController *weatherDetail = [segue destinationViewController];
    weatherDetail.weather = _weather;
}

@end
