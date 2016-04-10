//
//  ZZHomeTopic.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/10.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomeTopic.h"

@implementation ZZHomeTopic
MJCodingImplementation
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"tid"]) {
        propertyName = @"id";
    }
    return [propertyName mj_underlineFromCamel];
}
@end
