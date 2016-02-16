//
//  UserDetailsViewController.m
//  Registration
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserDetailsViewController.h"

@implementation UserDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lblName.text = _strName;
        
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
