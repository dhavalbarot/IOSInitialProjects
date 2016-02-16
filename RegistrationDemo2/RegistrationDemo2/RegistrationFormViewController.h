//
//  RegistrationFormViewController.h
//  RegistrationDemo2
//
//  Created by Dhaval Barot on 13/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationFormViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property BOOL flag;


@property (strong, nonatomic) UITextField *activeField;

@property (strong, nonatomic) IBOutlet UITextField *txtFirstName;
@property (strong, nonatomic) IBOutlet UITextField *txtLastName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtReTypePassword;
@property (strong, nonatomic) IBOutlet UITextField *txtMobileNumber;

- (IBAction)registerUser:(id)sender;
- (IBAction)viewLoginForm:(id)sender;


@end
