//
//  ZZEntryList.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/8.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZEntryList.h"

@implementation ZZEntryList
MJCodingImplementation
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"idString"]) {
        propertyName = @"id";
    }
    else if ([propertyName isEqualToString:@"desc"])
    {
        propertyName = @"description";
    }
    return [propertyName mj_underlineFromCamel];
}
@end
