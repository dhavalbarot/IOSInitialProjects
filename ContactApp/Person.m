//
//  Person.m
//  ContactApp
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "Person.h"

@implementation Person

static NSMutableArray *personList ;

-(void)setContactListInstance:(NSMutableArray *)contactList
{
    personList = contactList;
}

+(NSMutableArray *)getContactListInstance
{
    if (!personList) {
        personList = [[NSMutableArray alloc] init];
    }
    return personList;
}



@end
