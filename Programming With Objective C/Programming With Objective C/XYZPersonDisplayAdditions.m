//
//  XYZPersonDisplayAdditions.m
//  Programming With Objective C
//
//  Created by Dhaval Barot on 08/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "XYZPersonDisplayAdditions.h"


@implementation XYZPerson (XYZPersonDisplayAdditions)



- (void) lastNameFirstNameDisplay{
    NSLog(@"%@ %@",self.lastName,self.firstName);
    }

- (void) measureHeight:(float)h{
        _Height = h;
    }

- (void) measureWeight:(flaot)w{
        _Weight = w;
    }

- (id) initWithAll:(NSString *)firstName andLastName:(NSString *)lastName andDOB:(NSDate *)dob andHeight:(float)hght andWeight:(float)wght{
    
    self = [super init];
    self.firstName = firstName;
    self.lastName = lastName;
    self.dob = dob;
    
    return self;
}

@end

