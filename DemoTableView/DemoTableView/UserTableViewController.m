//
//  UserTableViewController.m
//  DemoTableView
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserTableViewCell.h"

@implementation UserTableViewController

//@synthesize userImageArray = _userImageArray;
//@synthesize userNameArray = _userNameArray;

- (void) viewDidLoad{
    
    [super viewDidLoad];
    
    self.userImageArray = [[NSArray alloc] initWithObjects:@"person.jpeg", @"person.jpeg", @"person.jpeg", nil];
    
    self.userNameArray = [[NSArray alloc] initWithObjects:@"FirstName LastName", @"FirstName LastName", @"FirstName LastName", nil];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.userNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"userTableCell";
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault     reuseIdentifier:cellId];
        
        cell.userImage.text = [self.userNameArray objectAtIndex:[indexPath row]]; //change in attributes
        
        UIImage *userPhoto = [UIImage imageNamed:[self.userImageArray objectAtIndex:[indexPath row]]];
        
        cell.userName.image = userPhoto; //Change in attributes
        
    }
    return cell;
}

@end
