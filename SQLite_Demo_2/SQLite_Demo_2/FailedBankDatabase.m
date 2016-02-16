//
//  FailedBankDatabase.m
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "FailedBankDatabase.h"
#import "FailedBankInfo.h"

@interface FailedBankDatabase()

@property (nonatomic, strong) NSString *databasePath;

@end

@implementation FailedBankDatabase

static FailedBankDatabase *_databases;


-(id) init
{
    self = [super init];
    if(self)
    {
        
        //NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"banklist" ofType:@"sqlite3"] ;
        //
        //        if(sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK)
        //        {
        //            NSLog(@"Failed to open database.");
        //        }
        
        [self copyDatabaseIntoDocumentDirectory];
        
    }
    
    return self;
}


-(void) copyDatabaseIntoDocumentDirectory
{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSError *error;
    
    NSString *destinationDBPath = [documentDirectory stringByAppendingPathComponent:@"banklist.sqlite3"];
    
    self.databasePath = destinationDBPath;
   // BOOL isFileExist =[fileManager fileExistsAtPath:destinationDBPath];
    if([fileManager fileExistsAtPath:destinationDBPath])
    {
        NSLog(@"File already exist, No need to copy.");
        return;
    }
    
    NSString *sourceDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"banklist.sqlite3"];
    
    if([fileManager copyItemAtPath:sourceDBPath toPath:destinationDBPath error:&error])
    {
        NSLog(@"Database file copied successfully.");
    }
    else
    {
        NSAssert1(0, @"Failed to copy database. Error: '%@'", [error localizedDescription]);
    }
    
    
}


+(FailedBankDatabase *)database
{
    if(_databases == nil)
    {
        _databases = [[FailedBankDatabase alloc] init];
    }
    
    return _databases;
}

-(NSArray *)failedBankInfos
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    NSString *query = @"SELECT id, name, city, state, zip, close_date, updated_date FROM failed_banks limit 5";
    sqlite3_stmt *statement;
    
    if(sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            char *cityChars = (char *) sqlite3_column_text(statement, 2);
            char *stateChars = (char *) sqlite3_column_text(statement, 3);
            char *zipChars = (char *) sqlite3_column_text(statement, 4);
            char *closeChars = (char *) sqlite3_column_text(statement, 5);
            char *updatedChars = (char *) sqlite3_column_text(statement, 6);
            
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
            NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
            NSString *zip = [[NSString alloc] initWithUTF8String:zipChars];
            NSString *close = [[NSString alloc] initWithUTF8String:closeChars];
            NSString *update = [[NSString alloc] initWithUTF8String:updatedChars];
            
            
            
            FailedBankInfo *info = [[FailedBankInfo alloc] initWithUniqueId:uniqueId name:name city:city state:state zip:zip closed:close update:update];
            
            [retval addObject:info];
            
        }
        
        sqlite3_finalize(statement);
    }
    
    return retval;
}

-(NSArray *) failedBankInfos2
{
    NSMutableArray *retValue = [[NSMutableArray alloc] init];
    
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        NSLog(@"Database File Open.");
        
        NSString *selectQuery = @"SELECT * FROM failed_banks limit 10";
        sqlite3_stmt *sqlStatement;
        
        if(sqlite3_prepare_v2(_database, [selectQuery UTF8String], -1, &sqlStatement, nil) == SQLITE_OK)
        {
            while(sqlite3_step(sqlStatement) == SQLITE_ROW)
            {
                int uniqueId = sqlite3_column_int(sqlStatement, 0);
                char *nameChars = (char *) sqlite3_column_text(sqlStatement, 1);
                char *cityChars = (char *) sqlite3_column_text(sqlStatement, 2);
                char *stateChars = (char *) sqlite3_column_text(sqlStatement, 3);
                char *zipChars = (char *) sqlite3_column_text(sqlStatement, 4);
                char *closeChars = (char *) sqlite3_column_text(sqlStatement, 5);
                char *updatedChars = (char *) sqlite3_column_text(sqlStatement, 6);
                
                NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
                NSString *city = [[NSString alloc] initWithUTF8String:cityChars];
                NSString *state = [[NSString alloc] initWithUTF8String:stateChars];
                NSString *zip = [[NSString alloc] initWithUTF8String:zipChars];
                NSString *close = [[NSString alloc] initWithUTF8String:closeChars];
                NSString *update = [[NSString alloc] initWithUTF8String:updatedChars];
                
                
                
                FailedBankInfo *info = [[FailedBankInfo alloc] initWithUniqueId:uniqueId name:name city:city state:state zip:zip closed:close update:update];
                
                [retValue addObject:info];
                
            }
            
            sqlite3_finalize(sqlStatement);

        }
        else
        {
            
            NSLog(@"Database can not open. Error: %s", sqlite3_errmsg(_database));
            sqlite3_close(_database);
            
        }
    }
    
    return retValue;
}

-(BOOL)updateDataById:(FailedBankInfo *)bankInfoObj
{
    sqlite3_stmt *statement;
    if(sqlite3_open([_databasePath UTF8String], &_database) == SQLITE_OK)
    {
        const char *updateQuery = "update failed_banks set name=?, city=?, state=?, zip=?, close_date=?, updated_date=? where id=?";
        if(sqlite3_prepare_v2(_database, updateQuery, -1, &statement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_int(statement, 7, bankInfoObj.uniqueId);
            sqlite3_bind_text(statement, 1, [bankInfoObj.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [bankInfoObj.city UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 3, [bankInfoObj.state UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 4, [bankInfoObj.zip UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 5, [bankInfoObj.closed UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 6, [bankInfoObj.update UTF8String], -1, SQLITE_TRANSIENT);
        }
        else
        {
            NSLog(@"Fail prepare statement.");
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
