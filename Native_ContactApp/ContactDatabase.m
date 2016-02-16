//
//  database.m
//  Native_ContactApp
//
//  Created by Dhaval Barot on 29/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "ContactDatabase.h"
#import "contact.h"

@interface ContactDatabase()

@property (nonatomic, strong) NSString *databasePath;

@end


@implementation ContactDatabase

static ContactDatabase *_singletonDatabase;

-(id) init
{
    self = [super init];
    if(self)
    {
        [self copyDatabaseIntoDocumentDirectory];
    }
    
    return self;
}

+(ContactDatabase *)database
{
    if(_singletonDatabase == nil)
    {
        _singletonDatabase = [[ContactDatabase alloc] init];
    }
    
    return _singletonDatabase;
}

-(void) copyDatabaseIntoDocumentDirectory
{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    
    NSError *error;
    
    NSString *destinationDBPath = [documentDirectory stringByAppendingPathComponent:@"Native_ContactApp.db"];
    
    self.databasePath = destinationDBPath;
    BOOL isFileExist =[fileManager fileExistsAtPath:destinationDBPath];
    if(isFileExist)
    {
        NSLog(@"File already exist, No need to copy.");
        return;
    }
    
    NSString *sourceDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Native_ContactApp.db"];
    
    if([fileManager copyItemAtPath:sourceDBPath toPath:destinationDBPath error:&error])
    {
        NSLog(@"Database file copied successfully.");
    }
    else
    {
        NSAssert1(0, @"Failed to copy database. Error: '%@'", [error localizedDescription]);
    }
    
}


-(NSMutableArray *)getContactListFromDatabase
{
    NSMutableArray *resultContactList = [[NSMutableArray alloc] init];
    
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        NSLog(@"Database file open.");
        
        NSString *selectQuery = @"SELECT * from contact order by first_name,last_name";
        
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(_database, [selectQuery UTF8String], -1, &sqlStatement, nil) == SQLITE_OK)
        {
            while (sqlite3_step(sqlStatement) == SQLITE_ROW)
            {
                NSInteger contactId = sqlite3_column_int(sqlStatement, 0);
                char *imageURLChar = (char *)sqlite3_column_text(sqlStatement, 1);
                char *first_nameChar = (char *)sqlite3_column_text(sqlStatement, 2);
                char *last_nameChar = (char *)sqlite3_column_text(sqlStatement, 3);
                char *companyChar = (char *)sqlite3_column_text(sqlStatement, 4);
                char *phoneChar = (char *)sqlite3_column_text(sqlStatement, 5);
                char *emailChar = (char *)sqlite3_column_text(sqlStatement, 6);
                char *urlChar = (char *)sqlite3_column_text(sqlStatement, 7);
                char *addressChar = (char *)sqlite3_column_text(sqlStatement, 8);
                char *birthdateChar = (char *)sqlite3_column_text(sqlStatement, 9);
                
                NSString *imageURL = (imageURLChar) ? [[NSString alloc] initWithUTF8String:imageURLChar] : nil ;
                NSString *first_name = (first_nameChar) ? [[NSString alloc] initWithUTF8String:first_nameChar] : nil;
                NSString *last_name = (last_nameChar) ? [[NSString alloc] initWithUTF8String:last_nameChar] : nil;
                NSString *company = (companyChar) ? [[NSString alloc] initWithUTF8String:companyChar] : nil;
                NSString *phone = (phoneChar) ? [[NSString alloc] initWithUTF8String:phoneChar] : nil;
                NSString *email = (emailChar) ? [[NSString alloc] initWithUTF8String:emailChar] : nil;
                NSString *url = (urlChar) ? [[NSString alloc] initWithUTF8String:urlChar] : nil;
                NSString *add = (addressChar) ? [[NSString alloc] initWithUTF8String:addressChar] : nil;
                NSString *birthdate = (birthdateChar) ? [[NSString alloc] initWithUTF8String:birthdateChar] : nil;
                
                contact *contactInfo = [[contact alloc] initWithContactId:contactId image:imageURL firstName:first_name lastName:last_name company:company phone:phone email:email url:url address:add birthDate:birthdate];
                
                [resultContactList addObject:contactInfo];
                
            }
            
            //sqlite3_finalize(sqlStatement);
        }
        else
        {
            NSLog(@"Database can not open. Error : %s", sqlite3_errmsg(_database));
            
        }
        sqlite3_finalize(sqlStatement);
        sqlite3_close(_database);
    }
    
    return resultContactList;
}

-(NSInteger)getLatestId
{
    NSInteger latestId;
    
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        NSLog(@"Database file open.");
        
        NSString *selectQuery = @"SELECT MAX(id) FROM contact";
        
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(_database, [selectQuery UTF8String], -1, &sqlStatement, nil) == SQLITE_OK)
        {
            while (sqlite3_step(sqlStatement) == SQLITE_ROW)
            {
                latestId = sqlite3_column_int(sqlStatement, 0);
            }
            
            sqlite3_finalize(sqlStatement);
        }
        else
        {
            NSLog(@"Database can not open. Error : %s", sqlite3_errmsg(_database));
            
        }
        sqlite3_close(_database);
    }
    
    return latestId;
}


-(BOOL) addContact:(contact *)contactPerson
{
    sqlite3_stmt *statement;
    
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        NSInteger contactId = (contactPerson.contactId)?contactPerson.contactId:nil;
        NSString *image = (contactPerson.imageURL) ? contactPerson.imageURL : nil;
        NSString *first_name = (contactPerson.first_name) ? contactPerson.first_name : nil;
        NSString *last_name = (contactPerson.last_name) ? contactPerson.last_name : nil;
        NSString *company = (contactPerson.company) ? contactPerson.company : nil;
        NSString *phone = (contactPerson.phone) ? contactPerson.phone : nil;
        NSString *email = (contactPerson.email) ? contactPerson.email : nil;
        NSString *url = (contactPerson.url) ? contactPerson.url : nil;
        NSString *address = (contactPerson.add) ? contactPerson.add : nil;
        NSString *birthdate = (contactPerson.birth_date) ? contactPerson.birth_date : nil;
        const char* query;
        
        
        if (contactId)
        {
              query = "UPDATE contact set image=?, first_name=?,last_name=?, company=?, phone=?, email=?, url=?, address=?, birthday=? where id=?";
           
        }
        else{
            query = "INSERT INTO contact (image, first_name, last_name, company, phone, email, url, address, birthday) values (?,?,?,?,?,?,?,?,?)";
            
        }
        
        
        if(sqlite3_prepare_v2(_database, query, -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [image UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [first_name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [last_name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [company UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 5, [phone UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 6, [email UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 7, [url UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 8, [address UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 9, [birthdate UTF8String], -1, SQLITE_TRANSIENT);
            
            if (contactId)
            {
                sqlite3_bind_int(statement, 10, contactId);
            }
        }
        else
        {
            NSLog(@"Fial prepare statement while inserting.");
        }
        
    }
    
    char *error;
    sqlite3_exec(_database, "COMMIT", NULL, NULL, &error);
        
    if(SQLITE_DONE != sqlite3_step(statement))
    {
        return false;
    }
        
    sqlite3_finalize(statement);
    
    sqlite3_close(_database);
        
    return true;
}

-(BOOL) deleteContactById:(NSInteger)contactId
{
    sqlite3_stmt *statement;
    
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        const char *query = "DELETE FROM contact WHERE id=?";
            
        //NSString *deleteQuery = [NSString stringWithUTF8String:query];
        
        if(sqlite3_prepare_v2(_database, query , -1, &statement, NULL) == SQLITE_OK)
        {
            
                sqlite3_bind_int(statement, 1, (int)contactId);
            
        }
        else
        {
            NSLog(@"Fial prepare statement while inserting.");
        }
        
    }
    
    char *error;
    
    sqlite3_exec(_database, "COMMIT", NULL, NULL, &error);
    
   
    
    if(SQLITE_DONE != sqlite3_step(statement))
    {
        return false;
    }
    
    sqlite3_finalize(statement);
    
    sqlite3_close(_database);
    
    return true;
    
}


@end
