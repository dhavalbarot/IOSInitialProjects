//
//  ViewController.h
//  MyFirstApp
//
//  Created by Dhaval Barot on 06/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet __weak UILabel *lbl_name;
}
@property (strong, nonatomic) IBOutlet UITextField *txt_name;

- (IBAction)setLabelName:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnName;

@property (weak, nonatomic) IBOutlet UIImageView *img1;

@end

