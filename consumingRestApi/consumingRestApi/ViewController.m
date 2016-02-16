//
//  ViewController.m
//  consumingRestApi
//
//  Created by Dhaval Barot on 05/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchGreeting];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fetchGreeting
{
    NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if(data.length > 0 && connectionError == nil)
        {
            NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            self.lblId.text = [[greeting objectForKey:@"id"] stringValue];
            self.lblGreetingMsg.text = [greeting objectForKey:@"content"];
        }
    }];
    
    
}
@end
