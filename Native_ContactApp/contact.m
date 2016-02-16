//
//  contact.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "contact.h"

@implementation contact


-(id) initWithContactId:(NSInteger)contactId image:(NSString *)imageURL firstName:(NSString *)first_name lastName:(NSString *)last_name company:(NSString *)company phone:(NSString *)phone email:(NSString *)email url:(NSString *)url address:(NSString *)add birthDate:(NSString *)birth_date
{
    self = [super init];
    
    if(self)
    {
        self.contactId = contactId;
        self.imageURL = imageURL;
        self.first_name = first_name;
        self.last_name = last_name;
        self.company = company;
        self.phone = phone;
        self.email = email;
        self.url = url;
        self.add = add;
        self.birth_date = birth_date;
    }
    
    return  self;
}

@end
