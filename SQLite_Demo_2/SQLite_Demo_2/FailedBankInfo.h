//
//  FailedBankInfo.h
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FailedBankInfo : NSObject{
    
    int _uniqueId;
    NSString *_name;
    NSString *_city;
    NSString *_state;
    
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic,copy) NSString *closed;
@property (nonatomic, copy) NSString *update;
@property (nonatomic, copy) NSString *zip;

-(id)initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city state:(NSString *)state zip:(NSString *)zip closed:(NSString *)closed update:(NSString *)update;
//-(id) initWithUniqueId:(int)uniqueId name:(NSString *)name city:(NSString *)city state:(NSString *)state;

@end
