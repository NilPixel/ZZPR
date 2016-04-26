//
//  ZZDataBaseManager.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/19.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZDataBaseManager.h"
#import "ZZHomePageData.h"
#import "ZZHomeBanner.h"
#import "ZZDBHelper.h"
@implementation ZZDataBaseManager
static NSString * const homeTableName = @"HOMETABLE";
static NSString * const bannerTableName = @"BANNERTABLEV2";
+ (ZZDataBaseManager *)shareInstance
{
    static ZZDataBaseManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc]init];
        [instance creatUserTable];
    });
    return instance;
}
//创建用户存储表
- (void)creatUserTable
{
    FMDatabaseQueue *queue = [ZZDBHelper getDataBaseQueue];
    if (queue == nil) {
        return;
    }
    [queue inDatabase:^(FMDatabase *db) {
        if (![ZZDBHelper isTableOk:homeTableName withDataBase:db]) {
            NSString *creatTableSQL = @"CREATE TABLE HOMETABLE (id integer PRIMARY KEY autoincrement , data blob ,page integer)";
            [db executeUpdate:creatTableSQL];
        }
        if ([ZZDBHelper isTableOk:bannerTableName withDataBase:db]) {
            NSString *creatTableSQL = @"CREATE TABLE BANNERTABLEV2 (id integer PRIMARY KEY autoincrement, data blob)";
            [db executeUpdate:creatTableSQL];
        }
    }];
}
// 插入homePageData
- (void)insertHomePageDataToDB:(ZZHomePageData *)pageData page:(NSInteger)page
{
    NSString *insertSql = @"REPLACE INTO HOMETABLE (data, page) VALUES (?, ?)";
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:pageData];
    FMDatabaseQueue *queue = [ZZDBHelper getDataBaseQueue];
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:insertSql,data,[NSNumber numberWithInteger:page]];
    }];
}
@end
