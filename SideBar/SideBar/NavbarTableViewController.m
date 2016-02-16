//
//  NavbarTableViewController.m
//  SideBar
//
//  Created by Dhaval Barot on 11/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "NavbarTableViewController.h"
#import "SWRevealViewController.h"

@interface NavbarTableViewController (){
    NSArray *menu;
}

@end

@implementation NavbarTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    menu = @[@"Item1",@"Item2", @"Item3", @"Item4", @"Item5", @"Item6", @"Item7", @"Item8"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIndentifier = [menu objectAtIndex:[indexPath row]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end
