//
//  CheckBoxCellViewControllerTableViewCell.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 05/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "CheckBoxCellViewControllerTableViewCell.h"

@implementation CheckBoxCellViewControllerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
//{
//    if (highlighted) {
//        self.lblName.textColor = [UIColor greenColor];
//    } else {
//        self.lblName.textColor = [UIColor blackColor];
//    }
//}



//-(void)setSelectedBackgroundView:(UIView *)selectedBackgroundView
//{
//    [selectedBackgroundView setBackgroundColor:[UIColor orangeColor]];
//}

@end
