//
//  UserDetailTableViewController.m
//  RegistrationDemo2
//
//  Created by Dhaval Barot on 13/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserDetailTableViewController.h"
#import "UserDetailCellViewController.h"

@implementation UserDetailTableViewController

//@synthesize arrUserDetailLabels = _arrUserDetailLabels;
//@synthesize arrUserDetailValues = _arrUserDetailValues;

- (void) viewDidLoad
{
    [super viewDidLoad];    
    _arrUserDetailLabels = [[NSMutableArray alloc] initWithObjects:@"First Name", @"Last Name", @"Email", @"Password", @"Phone No.", nil];
    _arrUserDetailValues = [[NSMutableArray alloc] initWithObjects: _strFirstName, _strLastName, _strEmail, _strPassword, _strPhoneNo, nil];
    
    //_dictUserDetails = @{@"First Name":_fName, @"LastName":_lName, @"Email":_email, @"Password":_password, @"Phone No.":_phoneNo};
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return #rows available in section
    return [_arrUserDetailLabels count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"UserDetailCell";
    
    UserDetailCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
    
        cell = [[UserDetailCellViewController alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    cell.lblLabelNames.text = [_arrUserDetailLabels objectAtIndex:[indexPath row]];
    cell.lblLabelValues.text = [_arrUserDetailValues objectAtIndex:[indexPath row]];
    
    return cell;
    
}


@end
