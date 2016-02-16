//
//  UserInfoController.m
//  RegistrationDemo1
//
//  Created by Dhaval Barot on 12/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserInfoController.h"
#import "UserDetailCellView.h"

@implementation UserInfoController
@synthesize phoneNo;
//- (void)loadView
//{
//    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
//    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [tableView reloadData];
//    
//    self.view = tableView;
//}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _labels = [[NSArray alloc] initWithObjects:@"XYZ",@"First Name", @"Last Name",@"Email",@"Password",@"Mobile No.", nil];
    _values = [[NSArray alloc] initWithObjects:@"ABC", _fName,_lName,_email,_password,phoneNo, nil];
    
//    _labels = [[NSArray alloc] initWithObjects:@"XYZ", nil];
//    _values = [[NSArray alloc] initWithObjects:@"ABC", nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return #rows available in section
    return [_labels count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"UserDataIdentifier";
    
    UserDetailCellView *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        
        cell = [[UserDetailCellView alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    cell.lblLabel.text = [_labels objectAtIndex:[indexPath row]];
    cell.lblUserInfo.text = [_values objectAtIndex:[indexPath row]];
    
    //Region *region = [regions objectAtIndex:indexPath.section];
    //TimeZoneWrapper *timeZoneWrapper = [region.timeZoneWrappers objectAtIndex:indexPath.row];
    //cell.textLabel.text = timeZoneWrapper.localeName;
    
    return cell;
}
@end
