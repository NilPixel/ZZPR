//
//  ZZListPostDynamic.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZListPostDynamic.h"
#import "ZZSubjectAuthor.h"
@implementation ZZListPostDynamic
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"likesUsers":[ZZSubjectAuthor class]};
}

 + (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    return [propertyName mj_underlineFromCamel];
}
@end
