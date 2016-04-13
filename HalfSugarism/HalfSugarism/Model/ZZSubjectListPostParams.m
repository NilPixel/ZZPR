//
//  ZZSubjectListPostParams.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZSubjectListPostParams.h"

@implementation ZZSubjectListPostParams
+ (instancetype)paramsWithTypeId:(NSString *)typeId subjectId:(NSString *)subjectId lastId:(NSString *)lastId page:(NSInteger)page pageSize:(NSInteger)pageSize
{
    ZZSubjectListPostParams *params = [[ZZSubjectListPostParams alloc]init];
    params.type_id = typeId;
    params.subject_id = subjectId;
    params.last_id = lastId;
    params.page = page;
    params.pagesize = pageSize;
    return params;
}
@end
