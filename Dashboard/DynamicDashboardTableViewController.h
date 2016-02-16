//
//  DynamicDashboardTableViewController.h
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicDashboardTableViewController : UITableViewController

-(void)registerForDeviceOriantation;
-(UIColor*)colorWithHexString:(NSString*)hex;

@end
