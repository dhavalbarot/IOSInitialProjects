//
//  BankDetailTableViewController.m
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "BankDetailTableViewController.h"
#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"


@interface BankDetailTableViewController ()

@end

@implementation BankDetailTableViewController
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.txtBankName.hidden = TRUE;
    self.txtCity.hidden = TRUE;
    self.txtState.hidden = TRUE;
    self.txtZip.hidden = TRUE;
    self.txtUpdateDate.hidden = TRUE;
    self.txtClosedDate.hidden = TRUE;
    
    self.lblBankName.text = self.name;
    self.lblCity.text = self.city;
    self.lblState.text = self.state;
    self.lblZip.text = self.zip;
    self.lblClosedDate.text = self.closed;
    self.lblUpdateDate.text = self.update;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openEditMode:(id)sender
{
  //  BOOL btnState = ([_btnEditSave.titleLabel.text isEqual:@"Save"]);
    
    if([_btnEditSave.titleLabel.text isEqual:@"Edit"])
    {
    
        self.txtBankName.text = self.name;
        self.txtCity.text = self.city;
        self.txtState.text = self.state;
        self.txtZip.text = self.zip;
        self.txtClosedDate.text = self.closed;
        self.txtUpdateDate.text = self.update;
    
        self.txtBankName.hidden = FALSE;
        self.txtCity.hidden = FALSE;
        self.txtState.hidden = FALSE;
        self.txtZip.hidden = FALSE;
        self.txtUpdateDate.hidden = FALSE;
        self.txtClosedDate.hidden = FALSE;
    
        [self.btnEditSave setTitle:@"Save" forState:UIControlStateNormal];
    }
    else
    {
        self.lblBankName.text = self.txtBankName.text;
        self.lblCity.text = self.txtCity.text;
        self.lblState.text = self.txtState.text;
        self.lblZip.text = self.txtZip.text;
        self.lblClosedDate.text = self.txtClosedDate.text;
        self.lblUpdateDate.text = self.txtUpdateDate.text;
        
        self.name = self.txtBankName.text;
        self.city = self.txtCity.text;
        self.state = self.txtState.text;
        self.zip = self.txtZip.text;
        self.closed = self.txtClosedDate.text;
        self.update = self.txtUpdateDate.text;

        
        self.txtBankName.hidden = TRUE;
        self.txtCity.hidden = TRUE;
        self.txtState.hidden = TRUE;
        self.txtZip.hidden = TRUE;
        self.txtUpdateDate.hidden = TRUE;
        self.txtClosedDate.hidden = TRUE;
        
        [self.btnEditSave setTitle:@"Edit" forState:UIControlStateNormal];

        
        FailedBankInfo *updatedInfo = [[FailedBankInfo alloc] initWithUniqueId:self.uniqueId name:self.lblBankName.text city:self.lblCity.text state:self.lblState.text zip:self.lblZip.text closed:self.lblClosedDate.text update:_lblUpdateDate.text];
        
        _bankInfo = updatedInfo;
        [delegate didUpdateBankData:self];
        
        BOOL isSuccess = [[FailedBankDatabase database] updateDataById:updatedInfo];
        if (!isSuccess) {
            NSLog(@"Error in update operation");
        }
    }
    

    
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
    return 7;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
