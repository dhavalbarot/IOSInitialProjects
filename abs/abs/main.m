//
//  main.m
//  abs
//
//  Created by Dhaval Barot on 04/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "test.m"

int main(int argc, const char * argv[]) {
    test *t = [[test alloc]init];
    [t add];
    int x = 5;
    //int x = [t add];
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World! and returned number of calling function is %d",x);
        
    }
    return 0;
}
