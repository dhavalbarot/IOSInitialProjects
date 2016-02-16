//
//  UserInfoController.h
//  RegistrationDemo1
//
//  Created by Dhaval Barot on 12/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoController : UITableViewController <UITableViewDataSource,UITableViewDataSource>

@property NSString *fName;
@property NSString *lName;
@property NSString *email;
@property NSString *password;
@property NSString *phoneNo;

@property NSArray *labels;
@property NSArray *values;

@end
