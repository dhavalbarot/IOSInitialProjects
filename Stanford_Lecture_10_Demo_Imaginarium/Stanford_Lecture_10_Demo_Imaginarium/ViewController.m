//
//  ViewController.m
//  Stanford_Lecture_10_Demo_Imaginarium
//
//  Created by Dhaval Barot on 19/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[ImageViewController class]])
    {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/v/iphone-5s/gallery/a/images/download/%@.jpg", segue.identifier]];
        //ImageViewController *ivc = [[ImageViewController alloc] init];
        //[ivc setImageFromLocal];
        ivc.title = segue.identifier;
    }
}

@end