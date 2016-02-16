//
//  ContactListTableViewController.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactListTableViewController.h"
#import "ContactDatabase.h"
#import "ContactTableViewCell.h"
#import "contact.h"
#import "AddContactDetailViewController.h"


@interface ContactListTableViewController (){
    
    NSArray *indexTitle;
    NSMutableDictionary *contactDictionary;
    BOOL isReload;
    BOOL isSegueRequire;
}

@end


@implementation ContactListTableViewController

//List of contacts
static NSMutableArray *contactList;


//return the contact list
+(NSMutableArray *)getContactListInstance
{
    return contactList;
}

- (IBAction)editDeleteMultipleRecord:(id)sender {
    if ([_btnEditDelete.titleLabel.text isEqualToString:@"Edit"]) {
        [self.tableView setEditing:YES animated:YES];
        [_btnEditDelete setTitle:@"Delete" forState:UIControlStateNormal];
      //  [self.tableView reloadData];
        isSegueRequire = false;
        
    }
    else
    {
        NSMutableArray *selectedRows = [NSMutableArray arrayWithArray:[self.tableView indexPathsForSelectedRows]];
        NSMutableArray *selectedContacts = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < selectedRows.count; i++)
        {
            NSIndexPath *indexPath = [selectedRows objectAtIndex:i];
            [selectedContacts addObject:[[contactDictionary objectForKey:[indexTitle objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]]];
        }
        
        for(int i = 0; i < selectedRows.count; i++)
        {
            NSIndexPath *indexPath = [selectedRows objectAtIndex:i];
            contact *contactDetail = [selectedContacts objectAtIndex:i];

            //Remove From Database
            [[ContactDatabase database] deleteContactById:contactDetail.contactId];

            //Remove From ContactList Array
            [contactList removeObject:contactDetail];
            
            //Remove From ContactDictionary
            NSMutableArray *temp = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:[indexPath section]]]];
            [temp removeObject:contactDetail];
            [contactDictionary setObject:temp forKey:[indexTitle objectAtIndex:[indexPath section]]];
            
            //[selectedContacts addObject:[[contactDictionary objectForKey:[indexTitle objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]]] ;
            
        }
        
        //Reloading TableView
        [self.tableView reloadData];
        
//        for (contact *contactVar in selectedContacts)
//        {
//            
//            [[ContactDatabase database] deleteContactById:contactVar.contactId];
//            [contactList removeObject:contactVar];
//           
//        }
        
        [_btnEditDelete setTitle:@"Edit" forState:UIControlStateNormal];
        isSegueRequire = true;
        [self.tableView setEditing:NO animated:YES];
    }
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    isReload = false;
    
    //Loading list of contact into contactList Array
    contactList = [[ContactDatabase database] getContactListFromDatabase];
    contactDictionary = [[NSMutableDictionary alloc] init];
    
    //creating and configuring search controller
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = false;
    
    //_searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    //_searchController.hidesNavigationBarDuringPresentation = NO;
    
    [_searchController.searchBar sizeToFit];
    isSegueRequire = true;
    
    //set searchbar on headerview
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.tableView reloadData];
    
    //Performing Indexing
    indexTitle = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#"];
   
    
    for(int i = 0; i < [indexTitle count]; i++)
    {
        NSPredicate *resultPredicate;
        
        //Set the predicate for A to Z and # index
        if(i == 26)
        {
            resultPredicate = [NSPredicate predicateWithFormat:@"SELF.first_name MATCHES %@", @"[^a-zA-Z].*"];        }
        else
        {
            resultPredicate = [NSPredicate predicateWithFormat:@"(SELF.first_name beginswith[c] %@) ", [indexTitle objectAtIndex:i]];
        }
        
        //NSArray *tempAry = (NSArray *)contactList;
        NSMutableArray *beginWithAlphabets = (NSMutableArray *)[contactList filteredArrayUsingPredicate:resultPredicate];
        [contactDictionary setValue:beginWithAlphabets forKey:[indexTitle objectAtIndex:i]];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Returns total number of objects
    if (self.searchController.active)
    {
        return 1;
    }
    else
    {
        return [indexTitle count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (!self.searchController.active)
    {
        if ([[contactDictionary objectForKey:[indexTitle objectAtIndex:section]] count])
        {
            return [indexTitle objectAtIndex:section];
        }
        return nil;
        
    }
    return @"Search Results";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.active)
    {
        return [_searchArray count];
    }
    else
    {
        NSString *sectionTitle = [indexTitle objectAtIndex:section];
        return [[contactDictionary objectForKey:sectionTitle] count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactTitleCell"];
    
    if(cell == nil)
    {
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactTitleCell"];
    }
    
    NSArray *sectionContacts = [contactDictionary objectForKey:[indexTitle objectAtIndex:[indexPath section]]];
    contact *contactPerson;
    
    if (self.searchController.active)
    {
       contactPerson = [_searchArray objectAtIndex:indexPath.row];
    }
    else
    {
       contactPerson = [sectionContacts objectAtIndex:indexPath.row];
    }
    
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *imageURL = [path stringByAppendingPathComponent:contactPerson.imageURL];
    
    if(contactPerson.imageURL)
    {
        cell.contactImage.image = [UIImage imageWithContentsOfFile:imageURL];
    }
    else
    {
        cell.contactImage.image = [UIImage imageNamed:@"person-icon.png"];
    }
    
    cell.contactName.text = [NSString stringWithFormat:@"%@ %@", contactPerson.first_name, contactPerson.last_name];
    
    
    return cell;
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSInteger row = [indexPath row];  //returns selected row
        NSInteger section = [indexPath section]; //returns section of selected row
        
        contact *deletedContact ;
        
        if (self.searchController.active)
        {
  
            deletedContact = [_searchArray objectAtIndex:row];
            [contactList removeObject:deletedContact];
            
            //find row and section of deleted contact in contact dictionary
            NSString *fChar = [[deletedContact.first_name uppercaseString] substringToIndex:1];
            
            char first_char = [[deletedContact.first_name uppercaseString] characterAtIndex:0];
            
            section = 26;
            
            if (first_char >= 'A' && first_char <= 'Z')
            {
                section = [indexTitle indexOfObject:fChar];
            }
            //section = [indexTitle indexOfObject:fChar];
            
            //NSArray *contactList = [contactDictionary objectForKey:fChar];
            row = [[contactDictionary objectForKey:fChar] indexOfObject:deletedContact];
            
            
        }
        
        
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:section]]]; // returns array of contacts of selected section
        NSInteger contactId = [(contact *)[temp objectAtIndex:row] contactId]; //return contactId of selected contact
        
        deletedContact = [temp objectAtIndex:row];
        [contactList removeObject:deletedContact];
        
        [temp removeObjectAtIndex:row];
        [contactDictionary setObject:temp forKey:[indexTitle objectAtIndex:section]];
        //indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [self.tableView reloadData];
        [self.searchController setActive:false];
        //[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
      
        [[ContactDatabase database] deleteContactById:contactId];
      
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    
//    NSInteger lastRow = [contactList count]-1;
    [super viewWillAppear:animated];
    
    if (_searchController.active)
    {
        _searchController.active = false;
    }
    
    if (isReload)
    {
        [self.tableView reloadData];
    }

    //Set editingenable of cell to true
   // [self.tableView setEditing:YES animated:YES];

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return isSegueRequire;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *destinationIdentifier = @"viewContactDetail";
    
    if ([segue.identifier isEqualToString:destinationIdentifier])
    {
        
        AddContactDetailViewController *controller = [segue destinationViewController];
        NSInteger row = [[self.tableView indexPathForSelectedRow] row];
        NSInteger section = [[self.tableView indexPathForSelectedRow] section];
        contact *selectedContact;
        
        if (_searchController.active)
        {
            selectedContact = [_searchArray objectAtIndex:row];
        }
        else
        {
            selectedContact = [[contactDictionary objectForKey:[indexTitle objectAtIndex:section]]objectAtIndex:row];
        }
        
        [controller setDelegate:self];
        controller.contactDetail = selectedContact;
        controller.row = row;
        controller.section = section;
        
        //_searchController.active = false;
        return;
    }
    
    NSLog(@"%@",[[[segue destinationViewController] class] description]);
    UINavigationController * nav = [segue destinationViewController];
    
    NSLog(@"%@",[[[nav.viewControllers objectAtIndex:0] class] description]);
    AddContactDetailViewController *controller = [nav.viewControllers objectAtIndex:0];
    
    //  AddContactDetailViewController *controller = [segue destinationViewController];
    [controller setDelegate:self];
    
    
}

//Used for Editing
-(void)sendSelectedRow:(NSInteger)row andSection:(NSInteger)section
{

    NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:row inSection:section];
   
    
    NSMutableArray *oldArray = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:section]]];
    contact *editedContact = [oldArray objectAtIndex:row];
    
    char firstChar = [[editedContact.first_name uppercaseString] characterAtIndex:0];
    NSInteger editedContactSection = 26;
    
    if(firstChar >= 'A' && firstChar <= 'Z')
    {
        editedContactSection = firstChar - 65;
    }
    
    if(section != editedContactSection)
    {
        [oldArray removeObject:editedContact];
        [contactDictionary setObject:oldArray forKey:[indexTitle objectAtIndex:section]];
        oldArray = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:editedContactSection]]];
        [oldArray addObject:editedContact];
        [contactDictionary setObject:oldArray forKey:[indexTitle objectAtIndex:editedContactSection]];
        isReload = true;
    }
    else
    {
        [self.tableView beginUpdates];
        [self.tableView reloadRowsAtIndexPaths:@[oldIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }
}


//Delegate performs to delete cell's row on deletion of record
-(void)removeContactFromContactList:(NSInteger)row andSection:(NSInteger)section andContactDetail:(contact *)deletedContact
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    
    if (self.searchController.active)
    {
        //find row and section of deleted contact in contact dictionary
        NSString *fChar = [[deletedContact.first_name uppercaseString] substringToIndex:1];
        section = [indexTitle indexOfObject:fChar];
        
        //NSArray *contactList = [contactDictionary objectForKey:fChar];
        row = [[contactDictionary objectForKey:fChar] indexOfObject:deletedContact];
        
    }
   
    NSMutableArray *temp = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:section]]];
    //contact *deletedContact = [temp objectAtIndex:row];
    [temp removeObjectAtIndex:row];
    [contactDictionary setObject:temp forKey:[indexTitle objectAtIndex:section]];
    //[self.tableView reloadData];
    //[self.searchController setActive:false];

    if(!_searchController.active)
    {
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }
   
    
}

//Delegate will insert new row in tableView
-(void)insertNewRow:(contact *)contactDetail
{
    NSString *fChar = [[contactDetail.first_name uppercaseString] substringToIndex:1];
    char first_char = [[contactDetail.first_name uppercaseString] characterAtIndex:0];
    
    NSInteger section = 26;
    
    if (first_char >= 'A' && first_char <= 'Z') {
        section = [indexTitle indexOfObject:fChar];
    }
   
    
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.first_name contains[c] %@",contactDetail.first_name];
    
    
    NSInteger lastRow = [[contactDictionary objectForKey:[indexTitle objectAtIndex:section]] count];
    
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:section];
    NSMutableArray *contactArry = [NSMutableArray arrayWithArray:[contactDictionary objectForKey:[indexTitle objectAtIndex:section]]];
    [contactArry addObject:contactDetail];
    [contactDictionary setObject:contactArry forKey:[indexTitle objectAtIndex:section]];
    [self.tableView beginUpdates];
    
    //[self.tableView insertRowsAtIndexPaths:(NSArray *)contactList withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:lastRow inSection:section]] withRowAnimation:UITableViewRowAnimationLeft];
    
    NSLog(@"Added a new cell to the bottom!");
    
    ContactTableViewCell *cell = (ContactTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:lastRow inSection:section]];
        
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *imageURL = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"img_%ld",contactDetail.contactId]];
    
    if(contactDetail.imageURL)
    {
        cell.contactImage.image = [UIImage imageWithContentsOfFile:imageURL];
    }
    else
    {
        cell.contactImage.image = [UIImage imageNamed:@"person-icon.png"];
    }
    
    
    cell.contactName.text = [NSString stringWithFormat:@"%@ %@",contactDetail.first_name,contactDetail.last_name];
    
    [self.tableView endUpdates];

}



//filter content based on text entered by user
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //_searchArray = nil;
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(SELF.first_name contains[c] %@) || (SELF.last_name contains[c] %@)", searchController.searchBar.text,searchController.searchBar.text];
    
    //Setting the search array
    _searchArray = [contactList filteredArrayUsingPredicate:resultPredicate];
    [self.tableView reloadData];
}


//Set the section title
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return indexTitle;
}

//Setting editing style for selected row
-(NSInteger)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3;
}


@end
