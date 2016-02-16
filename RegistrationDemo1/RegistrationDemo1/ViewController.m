//
//  ViewController.m
//  RegistrationDemo1
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"
#import "UserDetailViewController.h"
#import "UserInfoController.h"

@interface ViewController () <UITextFieldDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

     
- (IBAction)viewDetails:(id)sender {
    
    //Validate first name and last name
    NSString *nameRegExp = @"[a-zA-Z]*$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegExp];
    NSLog(@"%@",nameTest);
    BOOL isFistNameValid = [nameTest evaluateWithObject:_txtFirstName.text];
    BOOL isLastNameValid = [nameTest evaluateWithObject:_txtLastName.text];
    
    //Validate email
    NSString *emailRegExp = @"[a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-Z]{2,4}";
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:emailRegExp options:NSRegularExpressionCaseInsensitive error:nil];
    BOOL isValidEmail = [regExp numberOfMatchesInString:_txtEmail.text options:0 range:NSMakeRange(0, [_txtEmail.text length])];
    
    //Validate Password and RePassword
    BOOL isSamePassword = [_txtPassword.text isEqual:_txtRePassword.text];
    
    //Validate Mobile Number
    NSString *mobileNumRegExp = @"[0-9]{10}";
    NSRegularExpression *regExpMobNum = [[NSRegularExpression alloc] initWithPattern:mobileNumRegExp options:NSRegularExpressionCaseInsensitive error:nil];
    BOOL isValidMobileNumber = [regExpMobNum numberOfMatchesInString:_txtMobileNumber.text options:0 range:NSMakeRange(0, [_txtMobileNumber.text length])];
    
    BOOL isEmptyFirstName = [_txtFirstName.text isEqual:@""];
    BOOL isEmptyLastName = [_txtLastName.text isEqual:@""];
    BOOL isEmptyEmail = [_txtEmail.text isEqual:@""];
    BOOL isEmptyPassword  = [_txtPassword.text isEqual:@""];
    BOOL isEmptyRePassword = [_txtRePassword.text isEqual:@""];
    BOOL isEmptyMobile = [_txtMobileNumber.text isEqual:@""];
    
    if(!isValidEmail || !isLastNameValid || !isFistNameValid || isEmptyFirstName || isEmptyLastName || isEmptyEmail || isEmptyPassword || isEmptyRePassword || isEmptyMobile || !isValidMobileNumber || !isSamePassword)
    {

        NSMutableString *errorMsg = [[NSMutableString alloc] initWithString:@"Enter "];
        
        if (!isFistNameValid || isEmptyFirstName)
        {
            [_txtFirstName becomeFirstResponder];
            (!isFistNameValid)?[errorMsg appendString:@"Valid First Name"]:[errorMsg appendString:@"First Name"];
        }
        else if (!isLastNameValid || isEmptyLastName)
        {
            [_txtLastName becomeFirstResponder];
            (!isLastNameValid)?[errorMsg appendString:@"Valid Last Name"]:[errorMsg appendString:@"Last Name"];
        }
        else if (!isValidEmail || isEmptyEmail){
            [_txtEmail becomeFirstResponder];
            (!isValidEmail)?[errorMsg appendString:@"Valid Email Address"]:[errorMsg appendString:@"Email Address"];
        }
        else if (isEmptyPassword)
        {
            [_txtPassword becomeFirstResponder];
            [errorMsg appendString:@"Password"];
        }
        else if(isEmptyRePassword || !isSamePassword)
        {
            [_txtRePassword becomeFirstResponder];
            (!isEmptyRePassword)?[errorMsg setString:@"Password Doen't Match"]:[errorMsg setString:@"Retype Your Password"];
        }
        else if (isEmptyMobile || !isValidMobileNumber)
        {
            [_txtMobileNumber becomeFirstResponder];
            (!isValidMobileNumber)?[errorMsg appendString:@"Valid Mobile Number"]:[errorMsg appendString:@"Mobile Number"];
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed!" message:errorMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        return;
    }

//    UserInfoController *userInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"displayInfo"];
//    userInfo.fName = _txtFirstName.text;
//    userInfo.lName = _txtLastName.text;
//    userInfo.email = _txtEmail.text;
//    userInfo.password = _txtPassword.text;
//    userInfo.phoneNo = self.txtMobileNumber.text;
//    [userInfo setFName:self.txtFirstName.text];
//    [userInfo setLName:self.txtLastName.text];
//    [userInfo setEmail:self.txtEmail.text];
//    [userInfo setPassword:self.txtPassword.text];
//    [self.navigationController pushViewController:userInfo animated:YES];
    
    
//    UserDetailViewController *userDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetails"];
//    userDetailViewController.firstName = self.txtFirstName.text;
//    userDetailViewController.lastName = self.txtLastName.text;
//    userDetailViewController.email = self.txtEmail.text;
//    [self.navigationController pushViewController:userDetailViewController animated:YES];
    
    
    
    
    NSLog(@"Working well");
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayInfo"]) {
        UserInfoController *userInfo = [segue destinationViewController];
       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        userInfo.phoneNo = self.txtMobileNumber.text;
            [userInfo setFName:self.txtFirstName.text];
            [userInfo setLName:self.txtLastName.text];
            [userInfo setEmail:self.txtEmail.text];
            [userInfo setPassword:self.txtPassword.text];

    }
}

@end
