//
//  ZZSubscribeTag.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/17.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZSubscribeTag.h"

@implementation ZZSubscribeTag
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    return [propertyName mj_underlineFromCamel];
}
@end
