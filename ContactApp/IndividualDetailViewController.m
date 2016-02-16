//
//  IndividualDetailViewController.m
//  ContactApp
//
//  Created by Dhaval Barot on 28/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "IndividualDetailViewController.h"
#import "IndividualDetailTableViewCell.h"
#import "Person.h"
#import "ContactDatabase.h"

@interface IndividualDetailViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property NSArray *titles;


@property NSMutableArray *values; //It will store the textfieldsvalues


@end

@implementation IndividualDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles = [NSArray arrayWithObjects: @"First Name",@"Last Name",@"Company",@"Phone No.",@"Email Id",@"URL ",@"Address ",@"Birthdate ",nil];
    self.values = [[NSMutableArray alloc] init];
    //when user tapped on UIViewCell it will send user details through individual object.
    //Fetching individual details into mutable array.
    if (self.individual) {
        
        [self.values addObject:(self.individual.fname)?self.individual.fname:@""];
        [self.values addObject:(self.individual.lname)?self.individual.lname:@""];
        [self.values addObject:(self.individual.company)?self.individual.company:@""];
        [self.values addObject:(self.individual.phone)?self.individual.phone:@""];
        [self.values addObject:(self.individual.email)?self.individual.email:@""];
        [self.values addObject:(self.individual.url)?self.individual.url:@""];
        [self.values addObject:(self.individual.address)?self.individual.address:@""];
        [self.values addObject:(self.individual.birthdate)?self.individual.birthdate:@""];
    }
}

- (IBAction)addNewContact:(id)sender{
    if ([_btnAddSaveContact.title  isEqual: @"Add"]) {
        self.individual = [[Person alloc] init];
        
        for (int i=0; i<8; i++) {
            IndividualDetailTableViewCell *cell = (IndividualDetailTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            [self.values addObject:(cell.txtValue.text)?cell.txtValue.text:@""];
            
        }
        
        //Setting values of individual object
        self.individual.fname = [self.values objectAtIndex:0];
        self.individual.lname = [self.values objectAtIndex:1];
        self.individual.company = [self.values objectAtIndex:2];
        self.individual.phone = [self.values objectAtIndex:3];
        self.individual.email = [self.values objectAtIndex:4];
        self.individual.url = [self.values objectAtIndex:5];
        self.individual.address = [self.values objectAtIndex:6];
        self.individual.birthdate = [self.values objectAtIndex:7];
        
        //Add new contact into database
        BOOL isSucceed = [[ContactDatabase getContactDatabaseInstance] addContactToDatabase:self.individual];
        
        
        
    }
    
    
    
//    //Dummy Data
//    self.individual.image = @" ";
//    self.individual.fname = @"Akki";
//    self.individual.lname = @"Sanghvi";
//    self.individual.company = @"R.R.Sanghvi";
//    self.individual.phone = @"9876543210";
//    self.individual.email = @"abc@gmail.com";
//    
//    for (int i=0; i<8; i++) {
//        UITableViewCell *cell = (UITableViewCell *)[(UITableView *)self.tableView cellForRowAtIndexPath:self.indexpath];
//        UIView *view = cell.contentView.subviews;
//        UITextField *txtField = (UITextField *)view;
//        
//        NSIndexPath *index =
//        if (txtField.tag == 0) {
//            self.individual.fname = txtField.text;
//        }
//        if (txtField.tag == 1) {
//            self.individual.lname = txtField.text;
//        }
//    }
//    
//    
//    //Add new contact in database
//
//    
//    
//    
//    for(int i = 0; i <2; i++)
//    {
//        UITableViewCell *myCell = [self.tableView cellForRowAtIndexPath:0];
//        //NSLog(@"%@", myCell.txtValue.text]);
//        
//    }
    
   // self.individual.fname = [[self.tableView cellForRowAtIndexPath:self.indexpath] viewWithTag:0];
}


-(void)viewWillAppear:(BOOL)animated
{
    if (self.individual) {
      //  [_btnAddSaveContact set]
       [_btnAddSaveContact setTitle:@"Edit"];
    }
    else
    {
        
        [self.btnAddSaveContact setTitle:@"Add"];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactNames" forIndexPath:indexPath];
    static NSString *myIdentifier = @"individualInformation";
   
    IndividualDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    if (cell == nil) {
        cell = [[IndividualDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    }
    //int fieldNo = 0;
    NSString *labelHeading = [self.titles objectAtIndex:[indexPath row]];
    
    cell.lblTitle.text = labelHeading;
    cell.txtValue.placeholder = [NSString stringWithFormat:@"%@ %@",@"Enter ",labelHeading];
    cell.txtValue.delegate = self;
    
    if (self.individual) {
        cell.txtValue.text = [self.values objectAtIndex:[indexPath row]];
        //cell.txtValue.text = self.individual.fname;
    }
    
  
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
