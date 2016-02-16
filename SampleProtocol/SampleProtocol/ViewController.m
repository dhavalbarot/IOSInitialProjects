//
//  ViewController.m
//  SampleProtocol
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SampleProtocol *sampleProtocol = [[SampleProtocol alloc] init];
    sampleProtocol.delegate = self;
    [myLabel setText:@"Processing."];
    [sampleProtocol startSampleProcess];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Sample protocol delegate
- (void) processCompleted{
    [myLabel setText:@"Process completed."];
}

@end
