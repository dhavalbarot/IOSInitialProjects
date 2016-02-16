//
//  SampleProtocol.h
//  SampleProtocol
//
//  Created by Dhaval Barot on 09/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>


// Protocol Definition Start
@protocol SamleProtocolDeligate <NSObject>

@required

- (void) processCompleted;

@end
// Protocol Definition End

@interface SampleProtocol : NSObject

{
    id <SamleProtocolDeligate> _delegate;
}
@property (nonatomic, strong) id delegate;

- (void) startSampleProcess;

@end
