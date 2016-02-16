//
//  pageViewController.h
//  Imaginarium
//
//  Created by Dhaval Barot on 21/01/16.
//  Copyright (c) 2016 Chirag Sanghvi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIPageControl *pageController;
- (IBAction)changeScreenFromPageControlTool:(id)sender;

@end
