//
//  FailedBankListTableViewController.h
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailedBankListTableViewController : UITableViewController{
    NSArray *_failedBankInfos;
    
}

@property (nonatomic,retain) NSArray *failedBankInfos;

@end
