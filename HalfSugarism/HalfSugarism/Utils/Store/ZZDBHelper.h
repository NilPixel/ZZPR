//
//  ZZDBHelper.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/24.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase,FMDatabaseQueue;
@interface ZZDBHelper : NSObject

+ (FMDatabaseQueue *)getDataBaseQueue;

+ (BOOL)isTableOk:(NSString *)tableName withDataBase:(FMDatabase *)dataBase;

@end
