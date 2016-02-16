//
//  BankDetailTableViewController.h
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FailedBankInfo.h"


@protocol BankDetailTableViewControllerDelegate ;
@interface BankDetailTableViewController : UITableViewController
{
//    id<BankDetailTableViewControllerDelegate> delegate;
}

@property (nonatomic,assign) id<BankDetailTableViewControllerDelegate> delegate;


@property (nonatomic) int uniqueId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) NSString *update;
@property (nonatomic,strong) NSString *closed;
@property (nonatomic,strong) NSString *zip;

@property (nonatomic,strong) FailedBankInfo* bankInfo;



//@property

@property (strong, nonatomic) IBOutlet UILabel *lblBankName;
@property (strong, nonatomic) IBOutlet UILabel *lblCity;
@property (strong, nonatomic) IBOutlet UILabel *lblState;
@property (strong, nonatomic) IBOutlet UILabel *lblZip;
@property (strong, nonatomic) IBOutlet UILabel *lblClosedDate;
@property (strong, nonatomic) IBOutlet UILabel *lblUpdateDate;


@property (strong, nonatomic) IBOutlet UITextField *txtBankName;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UITextField *txtClosedDate;
@property (strong, nonatomic) IBOutlet UITextField *txtUpdateDate;

@property (strong, nonatomic) IBOutlet UIButton *btnEditSave;


@end

@protocol BankDetailTableViewControllerDelegate <NSObject>

-(void)didUpdateBankData:(BankDetailTableViewController *)failedBankInfo;

@end
