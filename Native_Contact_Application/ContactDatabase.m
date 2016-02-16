//
//  ContactDatabase.m
//  Native_Contact_Application
//
//  Created by Dhaval Barot on 25/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactDatabase.h"
#import "Person.h"

@interface ContactDatabase()

@property NSString* databasePath;

@end

@implementation ContactDatabase

static ContactDatabase *contactDatabaseInstance;

+(ContactDatabase*)database
{
    if (!contactDatabaseInstance) {
        contactDatabaseInstance = [[ContactDatabase alloc] init];
    }
    return contactDatabaseInstance;
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        [self copyDatabaseIntoDocumentDirectory];
    }
    
    return self;
}

-(void) copyDatabaseIntoDocumentDirectory
{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSError *error;
    
    NSString *destinationDBPath = [documentDirectory stringByAppendingPathComponent:@"Contact.db"];
    
    self.databasePath = destinationDBPath;
    
    // BOOL isFileExist =[fileManager fileExistsAtPath:destinationDBPath];
    if([fileManager fileExistsAtPath:destinationDBPath])
    {
        NSLog(@"File already exist, No need to copy.");
        return;
    }
    
    NSString *sourceDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Contact.db"];
    
    if([fileManager copyItemAtPath:sourceDBPath toPath:destinationDBPath error:&error])
    {
        NSLog(@"Database file copied successfully.");
    }
    else
    {
        NSAssert1(0, @"Failed to copy database. Error: '%@'", [error localizedDescription]);
    }
    
    
}

-(NSDictionary *)allContacts
{
    NSMutableDictionary *retValue = [[NSMutableDictionary alloc] init];
    Person *person;
    
    if(sqlite3_open([_databasePath UTF8String], &contactDatabase) == SQLITE_OK)
    {
        NSLog(@"Database File Open.");
        
        NSString *selectQuery = @"select id,first_name,last_name from person";
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(contactDatabase, [selectQuery UTF8String], -1, &sqlStatement, nil) == SQLITE_OK)
        {
            
            while(sqlite3_step(sqlStatement) == SQLITE_ROW)
            {
                person = [[Person alloc] init];
                int uniqueId = sqlite3_column_int(sqlStatement, 0);
                char *firstName = (char *) sqlite3_column_text(sqlStatement, 1);
                char *lastName = (char *) sqlite3_column_text(sqlStatement, 2);
                
                NSNumber *personId = [[NSNumber alloc] initWithInt:uniqueId];
                NSString *fname = [[NSString alloc] initWithUTF8String:firstName];
                NSString *lname = [[NSString alloc] initWithUTF8String:lastName];
               
                person.firstName = fname;
                person.lastName = lname;
                person.uniqueId = uniqueId;
               
                [retValue setObject:person forKey:personId];
                
                
               // FailedBankInfo *info = [[FailedBankInfo alloc] initWithUniqueId:uniqueId name:name city:city state:state zip:zip closed:close update:update];
                
                //[retValue addObject:info];
                
            }
            
            sqlite3_finalize(sqlStatement);
            
        }
        else
        {
            
            NSLog(@"Database can not open. Error: %s", sqlite3_errmsg(contactDatabase));
            sqlite3_close(contactDatabase);
            
        }
    }
    
    return retValue;

    
}


-(BOOL)insertDataDemo
{
    sqlite3_stmt *statement;
    if(sqlite3_open([_databasePath UTF8String], &contactDatabase) == SQLITE_OK)
    {
        const char *insertQuery = "insert into person(first_name,last_name) values('chirag','sanghvi')";
        sqlite3_prepare_v2(contactDatabase, insertQuery, -1, &statement, NULL);
        
    }
    char *error;
    sqlite3_exec(contactDatabase, "COMMIT", NULL, NULL, &error);
    
    if(SQLITE_DONE != sqlite3_step(statement))
    {
        return false;
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(contactDatabase);
    
    return true;
    
}


@end
