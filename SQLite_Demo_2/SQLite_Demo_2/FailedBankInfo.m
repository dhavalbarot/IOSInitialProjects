//
//  FailedBankInfo.m
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "FailedBankInfo.h"

@implementation FailedBankInfo


-(id) initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city state:(NSString *)state zip:(NSString *)zip closed:(NSString *)closed update:(NSString *)update
{
    self = [super init];
    if(self)
    {
        self.uniqueId = uniqueId;
        self.name = name;
        self.city = city;
        self.state = state;
        self.zip = zip;
        self.closed = closed;
        self.update = update;

    }
    
    return self;
}

//-(void) dealloc
//{
//    self.name = nil;
//    self.city = nil;
//    self.state = nil;
//    //[super dealloc];
//}

@end
