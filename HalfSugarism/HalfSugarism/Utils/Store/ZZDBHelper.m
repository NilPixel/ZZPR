//
//  ZZDBHelper.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/24.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZDBHelper.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
@implementation ZZDBHelper
static FMDatabaseQueue *dataBaseQueue = nil;

+ (FMDatabaseQueue *)getDataBaseQueue
{
    if (!dataBaseQueue) {
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [path objectAtIndex:0];
        NSString *dbPath = [documentDirectory stringByAppendingString:@"user.sqlite"];
        dataBaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    }
    return dataBaseQueue;
}
+ (BOOL)isTableOk:(NSString *)tableName withDataBase:(FMDatabase *)dataBase
{
    BOOL isOk = NO;
    FMResultSet * rs = [dataBase executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?",tableName];
    while ([rs next]) {
        NSInteger count = [rs intForColumn:@"count"];
        if (count == 0) {
            isOk = NO;
        }
        else
        {
            isOk = YES;
        }
    }
    [rs close];
    return isOk;
}
@end
