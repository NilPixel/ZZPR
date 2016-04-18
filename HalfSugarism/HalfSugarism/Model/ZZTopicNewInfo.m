//
//  ZZTopicNewInfo.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZTopicNewInfo.h"
#import "ZZProduct.h"
@implementation ZZTopicNewInfo
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    return [propertyName mj_underlineFromCamel];
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"product":[ZZProduct class]};
}
@end
@implementation Activity

@end