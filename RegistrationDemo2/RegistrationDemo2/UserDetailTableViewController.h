//
//  UserDetailTableViewController.h
//  RegistrationDemo2
//
//  Created by Dhaval Barot on 13/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailTableViewController : UITableViewController

@property NSString *strFirstName;
@property NSString *strLastName;
@property NSString *strEmail;
@property NSString *strPassword;
@property NSString *strPhoneNo;

@property NSMutableDictionary *dictUserDetails;

@property NSMutableArray *arrUserDetailLabels;
@property NSMutableArray *arrUserDetailValues;


@end
