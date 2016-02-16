//
//  XYZPerson.h
//  Programming With Objective C
//
//  Created by Dhaval Barot on 05/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZPerson : NSObject

@property (strong,readonly) NSString *firstName;
@property (weak) NSString *lastName;
@property NSDate *dob;
@property XYZPerson *partner;


- (void)sayHello;
- (void)saySomething:(NSString *)greeting;
- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andDOB:(NSDate *)dob;
+ (id)person;
- (void) dealloc;
- (void) setFName:(NSString *)fName;

@end
