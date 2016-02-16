//
//  database.h
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "contact.h"

@interface ContactDatabase : NSObject{
    
    sqlite3 *_database;
    
}

+(ContactDatabase *)database;

-(NSMutableArray *)getContactListFromDatabase;
-(BOOL) addContact:(contact *)contactPerson;
-(NSInteger) getLatestId;
-(BOOL) deleteContactById:(NSInteger)contactId;

@end
