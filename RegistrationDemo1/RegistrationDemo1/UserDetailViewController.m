//
//  UserDetailViewController.m
//  RegistrationDemo1
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserDetailViewController.h"

@implementation UserDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _lblFirstName.text = _firstName;
    _lblLastName.text = _lastName;
    _lblEmail.text = _email;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
