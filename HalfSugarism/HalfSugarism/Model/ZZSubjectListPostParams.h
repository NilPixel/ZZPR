//
//  ZZSubjectListPostParams.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZBaseRequestParams.h"

@interface ZZSubjectListPostParams : ZZBaseRequestParams

@property (nonatomic, copy) NSString *type_id;

@property (nonatomic, copy) NSString *subject_id;

@property (nonatomic, copy) NSString *last_id;

+ (instancetype)paramsWithTypeId:(NSString *)typeId
                       subjectId:(NSString *)subjectId
                          lastId:(NSString *)lastId
                            page:(NSInteger)page
                        pageSize:(NSInteger)pageSize;
@end
