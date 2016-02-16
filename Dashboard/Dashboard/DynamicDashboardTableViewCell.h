//
//  DynamicDashboardTableViewCell.h
//  Dashboard
//
//  Created by Dhaval Barot on 06/02/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicDashboardTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *imgContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *imgMenuImage;
@property (strong, nonatomic) IBOutlet UILabel *lblMenuLabel;


@end
