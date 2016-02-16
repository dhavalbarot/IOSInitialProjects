//
//  FailedBankDatabase.h
//  SQLite_Demo_2
//
//  Created by Dhaval Barot on 22/01/16.
//  Copyright (c) 2016 Dhaval Barot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FailedBankInfo.h"
#import "FailedBankDatabase.h"

@interface FailedBankDatabase : NSObject{
    
    sqlite3 *_database;
    
}

+(FailedBankDatabase *) database;
-(NSArray *) failedBankInfos;
-(NSArray *) failedBankInfos2;
-(BOOL)updateDataById:(FailedBankInfo *)bankInfoObj;

@end
