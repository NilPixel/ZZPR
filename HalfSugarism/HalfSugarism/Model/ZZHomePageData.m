//
//  ZZHomePageData.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/10.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomePageData.h"
#import "ZZHomeBanner.h"
#import "ZZEntryList.h"
#import "ZZHomeTopic.h"
#import "ZZCategoryElement.h"
#import "ZZFirstPageElement.h"
@implementation ZZHomePageData
MJCodingImplementation
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"banner":[ZZHomeBanner class],
             @"topic":[ZZHomeTopic class],
             @"categoryElement":[ZZCategoryElement class],
             @"firstPageElement":[ZZFirstPageElement class],
             @"entryList":[ZZEntryList class]
             };
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName mj_underlineFromCamel];
}
@end
