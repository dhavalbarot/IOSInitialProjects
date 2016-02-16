//
//  DashboardTableViewController.m
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "DashboardTableViewController.h"

@interface DashboardTableViewController () 

@end

@implementation DashboardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGFloat cellHeight = (self.tableView.contentSize.height / 4.0);
//    self.tableView.rowHeight = cellHeight;

    
   // [self.tableView setRowHeight:UITableViewAutomaticDimension];
    //[self.tableView setEstimatedRowHeight:115.0];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGFloat cellHeight = (self.tableView.frame.size.height-self.navigationController.navigationBar.frame.size.height)/4.0;
    if (cellHeight < 100) {
        
        //NSInteger row = [indexPath row];
        for (int i=0; i<4; i++) {
            UIImageView *img = [_img objectAtIndex:i];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.frame = CGRectMake(img.frame.origin.x, img.frame.origin.y, cellHeight - 40.0, cellHeight-40.0);
        }
        
        
        
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.tableView layoutIfNeeded];
//    CGFloat cellHeight = self.tableView.contentSize.height;
    
    CGFloat cellHeight = (self.tableView.frame.size.height-self.navigationController.navigationBar.frame.size.height)/4.0;
    if (cellHeight < 100) {
        
        NSInteger row = [indexPath row];
       
        UIImageView *img = [_img objectAtIndex:row];
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.frame = CGRectMake(img.frame.origin.x, img.frame.origin.y, cellHeight - 40.0, cellHeight-40.0);
        
        
    }
    
    return cellHeight;
}




//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DashboardCell" forIndexPath:indexPath];
//    
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DashboardCell"];
//    }
//    
//    return cell;
//}


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

//Setting TableView Cell size dynamically


@end
