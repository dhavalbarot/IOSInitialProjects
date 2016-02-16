//
//  IndividualDetailViewController.h
//  ContactApp
//
//  Created by Dhaval Barot on 28/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface IndividualDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) Person *individual;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnAddSaveContact;
- (IBAction)addNewContact:(id)sender;

@end
