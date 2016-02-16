//
//  DashboardTableViewController.h
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardTableViewController : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *img;

@property (strong, nonatomic) IBOutlet UIImageView *imgNotification;

@end
