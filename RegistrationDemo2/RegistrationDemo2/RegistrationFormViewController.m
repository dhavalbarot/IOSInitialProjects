//
//  RegistrationFormViewController.m
//  RegistrationDemo2
//
//  Created by Dhaval Barot on 13/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "RegistrationFormViewController.h"
#import "UserDetailTableViewController.h"



@implementation RegistrationFormViewController


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //UIScrollView *scrollView = (UIScrollView *)self.view;
    //tempScrollView.contentSize = CGSizeMake(1280, 960);
    _scrollView.frame = CGRectMake(0, 0, 320, 460);
    [_scrollView setContentSize:CGSizeMake(320, 678)];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)registerUser:(id)sender {
    
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
    BOOL isSamePassword = [_txtPassword.text isEqual:_txtReTypePassword.text];
    
    //Validate Mobile Number
    NSString *mobileNumRegExp = @"[0-9]{10}";
    NSRegularExpression *regExpMobNum = [[NSRegularExpression alloc] initWithPattern:mobileNumRegExp options:NSRegularExpressionCaseInsensitive error:nil];
    BOOL isValidMobileNumber = [regExpMobNum numberOfMatchesInString:_txtMobileNumber.text options:0 range:NSMakeRange(0, [_txtMobileNumber.text length])];
    
    BOOL isEmptyFirstName = [_txtFirstName.text isEqual:@""];
    BOOL isEmptyLastName = [_txtLastName.text isEqual:@""];
    BOOL isEmptyEmail = [_txtEmail.text isEqual:@""];
    BOOL isEmptyPassword  = [_txtPassword.text isEqual:@""];
    BOOL isEmptyRePassword = [_txtReTypePassword.text isEqual:@""];
    BOOL isEmptyMobile = [_txtMobileNumber.text isEqual:@""];
    
    _flag = YES;    //Validation OK..
    
    
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
     [_txtReTypePassword becomeFirstResponder];
     (!isEmptyRePassword)?[errorMsg setString:@"Password Doen't Match"]:[errorMsg setString:@"Retype Your Password"];
     }
     else if (isEmptyMobile || !isValidMobileNumber)
     {
     [_txtMobileNumber becomeFirstResponder];
     (!isValidMobileNumber)?[errorMsg appendString:@"Valid Mobile Number"]:[errorMsg appendString:@"Mobile Number"];
     }
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed!" message:errorMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     [alert show];
     
     _flag = NO;    //Validation Not Ok...
         
         
     }
    
// Method - 1 Redirecting To another View (For View Controller will not work with table view controller.
    
//    UserDetailTableViewController *userDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailTableView"];
//    userDetailViewController.strFirstName = self.txtFirstName.text;
//    userDetailViewController.strLastName = self.txtLastName.text;
//    userDetailViewController.strEmail = self.txtEmail.text;
//    [self.navigationController pushViewController:userDetailViewController animated:YES];

    //UserDetailTableViewController *userDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailTableView"];
    //[self.navigationController pushViewController:userDetailViewController animated:YES];

    //Method - 2 Redirecting To another View
    //[self performSegueWithIdentifier:@"displayInfo" sender:nil];
    
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return _flag;
}


- (IBAction)viewLoginForm:(id)sender {
    
}

//Method - 3 Redirecting To another View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayInfo"]) {
        UserDetailTableViewController *userInfo = [segue destinationViewController];
        userInfo.strFirstName = self.txtFirstName.text;
        userInfo.strLastName = self.txtLastName.text;
        userInfo.strEmail = self.txtEmail.text;
        userInfo.strPassword = self.txtPassword.text;
        userInfo.strPhoneNo = self.txtMobileNumber.text;
    }
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    NSLog(@"Registring Keyboard Method.");
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    
    NSLog(@"Displaying Keyboard");
    
//    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
//        [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
//    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    NSLog(@"Hiding Keyboard");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeField = nil;
}

@end
