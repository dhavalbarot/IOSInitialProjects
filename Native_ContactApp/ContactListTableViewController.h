//
//  ContactListTableViewController.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactDetailViewController.h"

@interface ContactListTableViewController : UITableViewController <AddContactDetailViewControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating>

@property NSArray *searchArray; //Array that will contain search results

//Controllers Properties
@property UISearchController *searchController;
@property (strong, nonatomic) IBOutlet UIButton *btnEditDelete;

//Methods
+(NSMutableArray*)getContactListInstance;
- (IBAction)editDeleteMultipleRecord:(id)sender;


@end
