//
//  DBManager.m
//  SQLite_Demo_1
//
//  Created by Dhaval Barot on 21/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import "DBManager.h"
#import <sqlite3.h>

@interface DBManager()

@property (nonatomic, strong) NSString *directoryPath;
@property (nonatomic, strong) NSString *fileName;

@end

@implementation DBManager

-(instancetype) initWithFileName:(NSString *)dbFileName
{
    self = [super init];
    
    if(self)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        self.directoryPath = [paths objectAtIndex:0];
        
        self.fileName = dbFileName;
        
        [self copyDatabaseIntoDocumentsDirectory];
    }
    
    return self;
}

-(void) copyDatabaseIntoDocumentsDirectory
{
    
}

@end
