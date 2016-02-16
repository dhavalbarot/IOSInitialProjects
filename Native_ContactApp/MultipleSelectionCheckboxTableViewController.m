//
//  MultipleSelectionCheckboxTableViewController.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 05/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "MultipleSelectionCheckboxTableViewController.h"
#import "CheckBoxCellViewControllerTableViewCell.h"


@interface MultipleSelectionCheckboxTableViewController ()

@property NSInteger selectedRow;

@end

@implementation MultipleSelectionCheckboxTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedRow = 99999;
    _names = [NSMutableArray arrayWithArray:@[@"Dhaval", @"Chirag", @"Zayn"]];
    _selectedIndexes = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_names count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CheckBoxCellViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[CheckBoxCellViewControllerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nameCell"];
    }
    
    cell.lblName.text = [_names objectAtIndex:[indexPath row]];
    
//    if ([indexPath row] == self.row) {
//        //[cell setEditing:YES ];
//       // [self.tableView setEditing:YES animated:YES];
//        [cell setSelected:YES animated:YES];
//    }
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView setEditing:YES animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 3;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:_selectedRow inSection:0];
    [tableView deselectRowAtIndexPath:oldIndexPath animated:NO];
    _selectedRow = [indexPath row];
    
    CheckBoxCellViewControllerTableViewCell *cell = (CheckBoxCellViewControllerTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    UIView *selectedBackgroundViewForCell = [UIView new];
    [selectedBackgroundViewForCell setBackgroundColor:[UIColor orangeColor]];
    cell.selectedBackgroundView = selectedBackgroundViewForCell;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedRow = 999999;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
