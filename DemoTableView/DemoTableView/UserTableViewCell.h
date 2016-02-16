//
//  UserTableViewCell.h
//  DemoTableView
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *userImage;
@property (strong, nonatomic) IBOutlet UIImageView *userName;


@end
