//
//  FailedBankTableViewController.h
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankDetailTableViewController.h"

@interface FailedBankTableViewController : UITableViewController <BankDetailTableViewControllerDelegate>

@property (nonatomic) NSMutableArray *failedBankInfos;
@property (nonatomic) NSMutableArray *failedBankInfos2;

@end
