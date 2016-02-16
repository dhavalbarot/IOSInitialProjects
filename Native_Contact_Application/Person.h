//
//  person.h
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>


//bean that contains person's personal details.
@interface Person : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic,strong) NSString *imagePath;
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *middleName;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic,strong) NSString *prefix;
@property (nonatomic,strong) NSString *suffix;
@property (nonatomic,strong) NSString *phoneticFirstName;
@property (nonatomic,strong) NSString *phoneticLastName;
@property (nonatomic,strong) NSString *phoneticMiddleName;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) NSString *jobTitle;
@property (nonatomic,strong) NSString *department;
@property (nonatomic,strong) NSString *notes;
@property (nonatomic,strong) NSDate *birthdate;
@property (nonatomic,strong) NSString *ringTone;
@property (nonatomic,strong) NSString *textTone;

@property (nonatomic,strong) NSMutableArray *Phones;
@property (nonatomic,strong) NSMutableArray *emails;
@property (nonatomic,strong) NSMutableArray *addresses;
@property (nonatomic,strong) NSMutableArray *urls;
@property (nonatomic,strong) NSMutableArray *dates;
@property (nonatomic,strong) NSMutableArray *relatedNames;
@property (nonatomic,strong) NSMutableArray *socialProfiles;
@property (nonatomic,strong) NSMutableArray *instantMsgs;


-(instancetype)initWithObject:(Person *)person;


@end
