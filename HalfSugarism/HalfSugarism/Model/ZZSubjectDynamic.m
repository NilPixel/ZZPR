//
//  ZZSubjectDynamic.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZSubjectDynamic.h"
#import "ZZSubjectAuthor.h"
#import "ZZSubjectRankAuthor.h"
@implementation ZZSubjectDynamic
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"rankList":[ZZSubjectRankAuthor class]};
}
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName mj_underlineFromCamel];
}
@end
