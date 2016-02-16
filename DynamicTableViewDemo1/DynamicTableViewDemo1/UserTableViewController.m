//
//  UserTableViewController.m
//  DynamicTableViewDemo1
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserTableViewCell.h"

@implementation UserTableViewController

// if needed syntthesize properties

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.userImages = [[NSArray alloc] initWithObjects:@"person.jpeg", @"person.jpeg", nil];
    self.userNames = [[NSArray alloc] initWithObjects:@"Dhaval Barot", @"Chirag Sanghvi", nil];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.userNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"userTableCell";
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIImage *userPhoto = [UIImage imageNamed:[self.userImages objectAtIndex:[indexPath row]]];
    cell.userImage.image = userPhoto;
    
    cell.userName.text = [self.userNames objectAtIndex:[indexPath row]];
    
    return cell;
    
}

@end
