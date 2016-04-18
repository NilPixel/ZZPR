//
//  ZZListPost.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZListPost.h"
#import "ZZProduct.h"
#import "ZZTag.h"
#import "ZZListPostDynamic.h"
#import "ZZSubjectAuthor.h"
#import "ZZListPostPics.h"
@implementation ZZListPost
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"product":[ZZProduct class],
             @"tags":[ZZTag class],
             @"pics":[ZZListPostPics class]};
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    return [propertyName mj_underlineFromCamel];
}
@end
