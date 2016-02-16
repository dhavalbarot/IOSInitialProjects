//
//  Section.h
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic,strong) NSString* name;
@property (nonatomic) NSInteger order;

@end
