//
//  ViewController.h
//  SingleForm
//
//  Created by Dhaval Barot on 06/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *lblUserName;

@property (nonatomic) IBOutlet UITextField *txtUserName;

- (IBAction)btnOk:(id)sender;

@end

