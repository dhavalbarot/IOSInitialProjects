//
//  UserDetailViewController.h
//  RegistrationDemo1
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblFirstName;
@property (strong, nonatomic) IBOutlet UILabel *lblLastName;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *email;

@end
