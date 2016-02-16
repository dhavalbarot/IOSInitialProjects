//
//  ContactTableViewCell.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *contactImage;
@property (strong, nonatomic) IBOutlet UILabel *contactName;

@end
