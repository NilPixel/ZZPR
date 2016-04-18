//
//  ZZProduct.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZProduct.h"

@implementation ZZProduct
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    else if ([propertyName isEqualToString:@"picArray"])
    {
        propertyName = @"pic";
    }
    return [propertyName mj_underlineFromCamel];
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"picArray":[ZZProductPic class],
             @"likesList":[ZZProductLiker class]};
}

@end
@implementation ZZProductLiker
@end

@implementation ZZProductPic
@end


