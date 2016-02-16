//
//  UserDetailsViewController.h
//  Registration
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) NSString *strName;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;
@property (strong, nonatomic) IBOutlet UILabel *lblAddress;

@end
