//
//  ViewController.h
//  consumingRestApi
//
//  Created by Dhaval Barot on 05/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblId;
@property (strong, nonatomic) IBOutlet UILabel *lblGreetingMsg;


- (IBAction)fetchGreeting;
@end

