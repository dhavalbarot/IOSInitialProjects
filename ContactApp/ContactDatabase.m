//
//  ContactDatabase.m
//  ContactApp
//
//  Created by Dhaval Barot on 27/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactDatabase.h"
#import "Person.h"

@interface ContactDatabase()

@property NSString *databasePath;

@end

@implementation ContactDatabase

static ContactDatabase *contactDatabaseInstance;

+(instancetype)getContactDatabaseInstance
{
    if (!contactDatabaseInstance) {
        contactDatabaseInstance = [[ContactDatabase alloc] init];
    }
    return contactDatabaseInstance;
}

-(id)init
{
    self = [super init];
    
    if (self) {
        [self copyDatabaseIntoDocumentDirectory];
    }
    
    return self;
}

-(void)copyDatabaseIntoDocumentDirectory
{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *documentDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *destinationPath = [documentDirectoryPath stringByAppendingPathComponent:@"ContactApp.db"];
        NSError *error;
    self.databasePath = destinationPath;
    BOOL isExist = [fileManager fileExistsAtPath:destinationPath];
    if (isExist)
    {
        NSLog(@"File exist");
        return;
    }
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ContactApp.db"];
    

    BOOL isCopied = [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&error];
    if (isCopied) {
        NSLog(@"Database successfully copied to destination path");
    }
    else
    {
        NSAssert1(0, @"Failed to copy database. Error: '%@'", [error localizedDescription]);
    }
}

-(NSMutableArray *)getContactListFromDatabase
{
    NSMutableArray *contactList = [Person getContactListInstance];
    if (sqlite3_open([_databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"Database opened");
        sqlite3_stmt *sqlStatement;
        
        //select query
        NSString *selectQuery = @"SELECT id, image,first_name,last_name,company,phone,email,url,address,birthdate FROM person order by first_name,last_name";
        NSInteger status = sqlite3_prepare_v2(database, [selectQuery UTF8String], -1, &sqlStatement, nil);
        if(status == SQLITE_OK)
        {
            Person *personDetail;
            while (sqlite3_step(sqlStatement) == SQLITE_ROW) {
                
                personDetail = [[Person alloc] init];
                int uniqueId = sqlite3_column_int(sqlStatement, 0);
                
                char *firstName = (char *)sqlite3_column_text(sqlStatement, 1);
                char *lastName = (char *)sqlite3_column_text(sqlStatement, 2);
                
                
                NSString *fName = (firstName) ? [[NSString alloc] initWithUTF8String:firstName] : nil;
                NSString *lName = (lastName) ? [[NSString alloc]initWithUTF8String:lastName] : nil;
                personDetail.fname = fName;
                personDetail.lname = lName;
                personDetail.uniqueId = uniqueId;
                
                [contactList addObject:personDetail];
                //[contactList setObject:personDetail atIndexedSubscript:nil];
            }
        
        }
    }
    return contactList;
}
/*
-(BOOL)addContactToDatabase:(Person *)person
{
    if (sqlite3_open([_databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"Database Opened");
        sqlite3_stmt *sqlStatement;
        NSString *img = (person.image)?person.image:@"";
        NSString *fname = (person.fname)?person.fname:@"";
        NSString *lname = (person.lname)?person.lname:@"";
        NSString *company=(person.company)?person.company:@"";
        NSString *phone = (person.phone)?person.phone:@"";
        NSString *email = (person.email)?person.email:@"";
        NSString *url = (person.url)?person.url:@"";
        NSString *address = (person.address)?person.address:@"";
        NSString *birthdate = (person.birthdate)?person.birthdate:@"";
        
        NSString *insertQuery = [NSString stringWithFormat:@"INSERT into person(image,first_name,last_name,company,phone,email,url,address,birthdate) values(/'%@/',/'%@/',/'%@/',/'%@/',/'%@/',/'%@/',/'%@/',/'%@/',/'%@/')",img,fname,lname,company,phone,email,url,address,birthdate];
        NSInteger status = sqlite3_prepare_v2(database, [insertQuery UTF8String], -1, &sqlStatement, nil);
        if (status) {
            if (sqlite3_step(sqlStatement) == SQLITE_DONE) {
                
                sqlite3_bind_text(sqlStatement, 1, [person.image UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 2, [person.fname UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 3, [person.lname UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 4, [person.company UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 5, [person.phone UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 6, [person.email UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 7, [person.url UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(sqlStatement, 8, [person.address UTF8String], -1, SQLITE_TRANSIENT);
                NSString *date = [NSString stringWithFormat:@"%@",person.birthdate];
                sqlite3_bind_text(sqlStatement, 9, [date UTF8String], -1, SQLITE_TRANSIENT);
                
            }else{
                
                NSLog(@"Error occured");
                return false;
                
            }
            
                
        }else{
            return false;
        }
        
        sqlite3_finalize(sqlStatement);
        sqlite3_close(database);
    }else{
        return false;
    }
    return true;
}
*/

-(BOOL)addContactToDatabase:(Person *)person
{
    sqlite3_stmt *statement;
    if(sqlite3_open([_databasePath UTF8String], &database) == SQLITE_OK)
    {
        NSString *img = (person.image)?person.image:@"";
        NSString *fname = (person.fname)?person.fname:@"";
        NSString *lname = (person.lname)?person.lname:@"";
        NSString *company=(person.company)?person.company:@"";
        NSString *phone = (person.phone)?person.phone:@"";
        NSString *email = (person.email)?person.email:@"";
        NSString *url = (person.url)?person.url:@"";
        NSString *address = (person.address)?person.address:@"";
        NSString *birthdate = (person.birthdate)?person.birthdate:@"";
        
        //Insert Query string
        const char *insertQuery = "INSERT into person(image,first_name,last_name,company,phone,email,url,address,birthdate) values(?,?,?,?,?,?,?,?,?)";
        if(sqlite3_prepare_v2(database, insertQuery, -1, &statement, NULL) == SQLITE_OK)
        {
            //sqlite3_bind_int(statement, 7, bankInfoObj.uniqueId);
            sqlite3_bind_text(statement, 1, [img UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [fname UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [lname UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [company UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 5, [phone UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 6, [email UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 7, [url UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 8, [address UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 9, [birthdate UTF8String], -1, SQLITE_TRANSIENT);
            
        }
        else
        {
            NSLog(@"Fail prepare statement.");
        }
    }
    char *error;
    sqlite3_exec(database, "COMMIT", NULL, NULL, &error);
    
    if(SQLITE_DONE != sqlite3_step(statement))
    {
        return false;
    }
    
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    return true;
}

@end
