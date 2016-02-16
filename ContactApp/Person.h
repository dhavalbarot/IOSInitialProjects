//
//  Person.h
//  ContactApp
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSInteger uniqueId;
@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSString *fname;
@property (nonatomic,strong) NSString *lname;
@property (nonatomic,strong) NSString *company;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSDate *birthdate;

+(NSMutableArray *)getContactListInstance;
-(void)setContactListInstance:(NSMutableArray *)contactList;


@end
