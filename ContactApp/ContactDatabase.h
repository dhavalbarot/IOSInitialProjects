//
//  ContactDatabase.h
//  ContactApp
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Person.h"

@interface ContactDatabase : NSObject{
    sqlite3 *database;
}

+(instancetype)getContactDatabaseInstance;
-(NSMutableArray *)getContactListFromDatabase;
-(BOOL)addContactToDatabase:(Person *)person;


@end
