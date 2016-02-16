//
//  PersonContactDetail.h
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonContactDetail : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic) NSInteger personId;
@property (nonatomic) NSInteger labelId;
@property (nonatomic) NSInteger sectionId;
@property (nonatomic,strong) NSString* value;

-(instancetype)initWithObject:(PersonContactDetail*)personContactDetail;

@end
