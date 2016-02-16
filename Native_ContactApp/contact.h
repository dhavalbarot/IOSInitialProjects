//
//  contact.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "address.h"

@interface contact : NSObject{
    
    NSInteger _contactId;
    NSString *_imageURL;
    NSString *_first_name;
    NSString *_last_name;
    NSString *_company;
    NSString *_phone;
    NSString *_email;
    NSString *_url;
    NSString *_add;
    NSString *_birth_date;
}

@property (nonatomic) NSInteger contactId;
@property (nonatomic,strong) NSString *imageURL;
@property (nonatomic,strong) NSString *first_name;
@property (nonatomic,strong) NSString *last_name;
@property (nonatomic,strong) NSString *company;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *add;
@property (nonatomic,strong) NSString *birth_date;

-(id)initWithContactId:(NSInteger)contactId image:(NSString *)imageURL firstName:(NSString *)first_name lastName:(NSString *)last_name company:(NSString *)company phone:(NSString *)phone email:(NSString *)email url:(NSString *)url address:(NSString *)add birthDate:(NSString *)birth_date;

@end
