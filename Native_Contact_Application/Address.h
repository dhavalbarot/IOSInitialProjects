//
//  Address.h
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic) NSInteger personId;
@property (nonatomic,strong) NSString *street;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *state;
@property (nonatomic) NSInteger zip;
@property (nonatomic,strong) NSString *country;

-(instancetype)initWithObject:(Address *)address;

@end
