//
//  ViewController.h
//  SampleProtocol
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleProtocol.h"

@interface ViewController : UIViewController <SamleProtocolDeligate>
{
    IBOutlet UILabel *myLabel;
}
@end

