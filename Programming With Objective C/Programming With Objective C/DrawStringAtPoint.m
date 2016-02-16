//
//  DrawStringAtPoint.m
//  Programming With Objective C
//
//  Created by Dhaval Barot on 08/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "DrawStringAtPoint.h"


@implementation NSString (DrawStringAtPoint)

-(void) drawStringAtPointMethod:(NSString *)greeting{
    NSString *str = [greeting uppercaseString];
      NSLog(@"%@",str); }

- (void)drawInRect:(NSRect)aRect{ NSRect rect = aRect; aRect.origin.x=9; aRect.origin.y=5; [@"abcde" drawInRect:rect]; }
 //-(void)sayHi{ [self upperCaseString:(NSString *)@"abcde"]; }
    



@end
