//
//  FailedBankTableViewController.m
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "FailedBankTableViewController.h"
#import "FailedBankTableViewCell.h"
#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"
#import "BankDetailTableViewController.h"



@interface FailedBankTableViewController ()
@property NSIndexPath *selectedIndex;
@end

@implementation FailedBankTableViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.failedBankInfos = [FailedBankDatabase database].failedBankInfos2;
  //  delegate = self;
    
}

-(void)didUpdateBankData:(BankDetailTableViewController *)failedBankInfo
{
    
    NSInteger row = [_selectedIndex row];
    [self.failedBankInfos2 removeObjectAtIndex:row];
    [self.failedBankInfos2 insertObject:failedBankInfo.bankInfo atIndex:row];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.failedBankInfos = [FailedBankDatabase database].failedBankInfos2;
    if (_selectedIndex) {
        [self.tableView beginUpdates];
        [self.tableView reloadRowsAtIndexPaths:@[_selectedIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }
    
    
    //[self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.failedBankInfos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell";
    
    FailedBankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if(cell == nil)
    {
        cell = [[FailedBankTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }

    FailedBankInfo *info = [_failedBankInfos objectAtIndex:indexPath.row];
    
    cell.lblBankName.text = info.name;
    cell.lblCityState.text = [NSString stringWithFormat:@"%@, %@", info.city, info.state];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   _selectedIndex = [self.tableView indexPathForSelectedRow];
    BankDetailTableViewController *bankDetail = [segue destinationViewController];
    NSInteger row = [_selectedIndex row];
    FailedBankInfo *bank = [self.failedBankInfos objectAtIndex:row];
    
    bankDetail.name = bank.name;
    bankDetail.city = bank.city;
    bankDetail.state = bank.state;
    bankDetail.zip = bank.zip;
    bankDetail.closed = bank.closed;
    bankDetail.update = bank.update;
    bankDetail.uniqueId = bank.uniqueId;
    
}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//   
//    
//    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
//    BankDetailTableViewController *bankDetail = [segue destinationViewController];
//    NSInteger *row = [selectedIndex row];
//    FailedBankInfo *bank = [self.failedBankInfos objectAtIndex:row];
//    bankDetail.name = bank.name;
//    
//    
//}



@end
