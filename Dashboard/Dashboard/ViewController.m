//
//  ViewController.m
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.view);
    [self registerForDeviceOriantation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)registerForDeviceOriantation
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationChanged{
    for(UIView *view in self.view.subviews)
    {
        
        NSLog(@"%f",view.frame.size.height);
    }
}

@end
