//
//  ContactListTableViewController.m
//  ContactApp
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "Person.h"
#import "ContactDatabase.h"
#import "ContactListTableViewCell.h"
#import "IndividualDetailViewController.h"

@interface ContactListTableViewController ()

@end

@implementation ContactListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *contactList = [Person getContactListInstance];
    
    contactList = [[ContactDatabase getContactDatabaseInstance] getContactListFromDatabase];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[Person getContactListInstance] count];
    //return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactNames" forIndexPath:indexPath];
   static NSString *myIdentifier = @"contactNames";
    
    ContactListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    if (cell == nil) {
        cell = [[ContactListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    }
    NSMutableArray *contactList = [Person getContactListInstance];
   // cell.personName = [NSString stringWithFormat:@"%@ %@",@"Chirag",@"Sanghvi"];
    if ([contactList count]) {
        Person *personDetails = [contactList objectAtIndex:[indexPath row]];
        cell.personName.text = [NSString stringWithFormat:@"%@ %@",[personDetails fname],[personDetails lname]];
    }
    else
        cell.personName.text = @" asaa ";
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier = @"showContactDetail";
    if ([[segue identifier] isEqualToString:identifier]) {
        IndividualDetailViewController *contactInfo = [segue destinationViewController];
        
        NSInteger row = [[self.tableView indexPathForSelectedRow] row];
      
        //contactInfo.row = row;
        Person *contact = [[Person getContactListInstance] objectAtIndex:row];
        
        contactInfo.individual = contact;
        
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
