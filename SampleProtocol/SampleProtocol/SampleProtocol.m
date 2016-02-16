//
//  SampleProtocol.m
//  SampleProtocol
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "SampleProtocol.h"


@implementation SampleProtocol

- (void) startSampleProcess{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate selector:@selector(processCompleted) userInfo:nil repeats:NO];
}
@end
