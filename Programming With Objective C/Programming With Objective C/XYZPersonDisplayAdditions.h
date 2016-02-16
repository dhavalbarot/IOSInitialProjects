//
//  XYZPersonDisplayAdditions.h
//  Programming With Objective C
//
//  Created by Dhaval Barot on 08/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"

@interface XYZPerson (XYZPersonDisplayAdditions)

@property (readonly, nonatomic, getter=measureWeight) float Height;
@property (readonly, nonatomic, getter=measureHeight) float Weight;


- (void) lastNameFirstNameDisplay;
- (float) measureWeight;
- (float) measureHeight;

@end
