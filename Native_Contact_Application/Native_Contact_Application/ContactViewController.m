//
//  ContactViewController.m
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactDatabase.h"
#import "ContactDetailsTableViewCell.h"
#import "ContactDetailList.h"
#import "Person.h"
#import "Section.h"
#import "Label.h"


@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContactDatabase *contactDatabase = [ContactDatabase database];
    contactDatabase.insertDataDemo;
    contactDatabase.allContacts;
    
    
   // self.contactInfos =
    
    
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
