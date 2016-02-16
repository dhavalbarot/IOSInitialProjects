//
//  DynamicDashboardTableViewController.m
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "DynamicDashboardTableViewController.h"
#import "DynamicDashboardTableViewCell.h"

@interface DynamicDashboardTableViewController (){
    NSMutableArray *dashboardMenuImages;
    NSMutableArray *dashboardMenuTitles;
}

@end

@implementation DynamicDashboardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForDeviceOriantation];
    [self.tableView setScrollEnabled:false];
    //[self.tableView setSeparatorColor:[UIColor colorWithRed:((float)(0xB2B2B2 & 0xFF0000) >> 16))/255.0 green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>];
    //dashboardMenuImages = [NSMutableArray arrayWithArray:@[@"notif",@"notif",@"notif",@"notif."]];
    dashboardMenuTitles = [NSMutableArray arrayWithArray:@[@"Notification", @"Repport Requests", @"Team Requests", @"Repport Suggestions"]];
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicDashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DynamicDashboardCell" forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [[DynamicDashboardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DynamicDashboardCell"];;
    }
   
   // cell.imgMenuImage.image = [dashboardMenuImages objectAtIndex:[indexPath row]];
    cell.lblMenuLabel.text = [dashboardMenuTitles objectAtIndex:[indexPath row]];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = (self.tableView.frame.size.height-self.navigationController.navigationBar.frame.size.height-self.tabBarController.tabBar.frame.size.height)/4.0;

    //NSLog(@"%d",[UIDevice currentDevice].orientation);
    if ([UIDevice currentDevice].orientation == 1) {
        cellHeight = cellHeight - 5;
    }
    return cellHeight;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForDeviceOriantation
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
  }


-(void)orientationChanged
{
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [self.tableView reloadData];
//    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
////    //[self viewWillAppear:YES];
}

     
-(UIColor*)colorWithHexString:(NSString*)hex
{
        NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        
        // String should be 6 or 8 characters
        if ([cString length] < 6) return [UIColor grayColor];
        
        // strip 0X if it appears
        if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
        
        if ([cString length] != 6) return  [UIColor grayColor];
        
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)  
                                blue:((float) b / 255.0f)  
                               alpha:1.0f];  
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
