//
//  ZZCommunitySubject.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZCommunitySubject.h"

@implementation ZZCommunitySubject
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    else if ([propertyName isEqualToString:@"desc"])
    {
        propertyName = @"description";
    }
    return [propertyName mj_underlineFromCamel];
}
@end
