//
//  XYZPerson.m
//  Programming With Objective C
//
//  Created by Dhaval Barot on 05/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "XYZPerson.h"

@implementation XYZPerson

 
- (void)sayHello{
        [self saySomething:@"Hello Mr "];
    }

+ (id)person{
    return [[self alloc] init];
    }

- (void)saySomething:(NSString *)greeting{
    NSLog(@"%@ %@ %@ !", greeting, [self firstName],[self lastName]);
    }

- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andDOB:(NSDate *)dob{
    //[self setFirstName:firstName];
    [self setLastName:lastName];
    [self setDob:dob];
    return self;
}

- (id)init{
    return [self initWithFirstName:@"Dhaval" andLastName:@"Barot" andDOB:nil];
    }

- (void) dealloc{
    NSLog(@"XYZPerson object is being deallocated.\n");
}

- (void) setFName:(NSString *)fName;
{
    _firstName = fName;
}

@end
