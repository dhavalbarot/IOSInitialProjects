//
//  address.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface address : NSObject

@property (nonatomic, strong) NSString *street1;
@property (nonatomic, strong) NSString *street2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *country;

@end
