//
//  main.m
//  Programming With Objective C
//
//  Created by Dhaval Barot on 05/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZPerson.h"
#import "XYZShoutingPerson.h"
#import "XYZPersonDisplayAdditions.h"
#import "DrawStringAtPoint.h"


int main(int argc, const char * argv[]) {
    
    


    @autoreleasepool {
        XYZPerson *firstPerson = [XYZPerson person];
        //XYZPerson *secondPerson = [[XYZPerson alloc] initWithFirstName:@"Chirag" andLastName:@"Sanghvi" andDOB:nil];
        
        XYZPerson *secondPerson = [[XYZPerson alloc] initWithAll:@"Chirag" andLastName:@"Sanghvi" andDOB:nil andHeight:5.6 andWeight:60.35];

        
        firstPerson.partner = secondPerson;
        
        //NSMutableString *mutableFirstName = [NSMutableString stringWithString:firstPerson.firstName];
        //NSLog(@"%@", mutableFirstName);
        
        //[mutableFirstName appendString:@"lll"];
        //firstPerson.firstName = mutableFirstName;
        
        NSLog(@"%@", firstPerson.firstName);
        NSLog(@"%@", firstPerson.lastName);
        NSLog(@"%@", firstPerson.partner.firstName);
        
        [firstPerson lastNameFirstNameDisplay];
        
        //[firstPerson sayHello];
        //[mutableFirstName setString:@"Chirag"];
        //[firstPerson sayHello];
        //NSLog(@"%@",mutableFirstName);
        //firstPerson.firstName = nil;
        
        //NSString *greeting = [[NSString alloc] init];
        
        
        
        
    }
   
    
    
    
    //[firstPerson setFirstName:@"Chirag"];
    //[firstPerson setLastName:@"Sanghvi"];
    
    //NSLog(@"First Name : %@", [firstPerson firstName]);
    //NSLog(@"Last Name : %@", [firstPerson lastName]);
    
    //XYZShoutingPerson *shoutingPerson = [[XYZShoutingPerson alloc]init];
    //[shoutingPerson sayHello];
    
    //XYZPerson *person = [[XYZPerson alloc]init];
    //NSLog(@"First Name : %@", [person firstName]);
    //NSLog(@"Last Name : %@", [person lastName]);

    //if(!person)
    //{
    //    NSLog(@"%@",shoutingPerson);
    //}
    
    
    return 0;
}
