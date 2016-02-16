//
//  ContactDatabase.h
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface ContactDatabase : NSObject{
    sqlite3 *contactDatabase;
}

//@property (nonatomic,strong) ContactDatabase* instance;

-(NSDictionary *)allContacts;
-(BOOL)insertDataDemo;

+(ContactDatabase *)database;

@end
