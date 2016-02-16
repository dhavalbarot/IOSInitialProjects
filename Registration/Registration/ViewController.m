//
//  ViewController.m
//  Registration
//
//  Created by Dhaval Barot on 11/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"
#import "UserDetailsViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextView *txtAddress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtName.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)printDetail:(id)sender {
    NSLog(@"FirstName: %@ \n Email:%@ Address: %@",self.txtName.text,self.txtEmail.text,self.txtAddress.text);
    UserDetailsViewController *obj =  [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetails"];
    obj.strName = _txtName.text;
    [self.navigationController pushViewController:obj animated:YES];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"UserDetails"]){
//        NSLog(@"%@",self.txtName.text);
//        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
//        UserDetailsViewController *userInfo = (UserDetailsViewController*)[navController topViewController];
////        userInfo.strName = self.txtName.text;
//        [userInfo setStrName:self.txtName.text];
//        NSLog(@"%@",userInfo.lblName);
//    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%@",self.txtName);

}           // came first responder

@end
