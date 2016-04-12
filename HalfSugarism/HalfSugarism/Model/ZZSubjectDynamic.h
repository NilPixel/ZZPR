//
//  ZZSubjectDynamic.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZZSubjectAuthor,ZZSubjectRankAuthor;
@interface ZZSubjectDynamic : NSObject
@property (nonatomic, copy) NSString *partInNum;

@property (nonatomic, strong) NSArray<ZZSubjectRankAuthor *> *rankList;

@property (nonatomic, strong) ZZSubjectAuthor *currentUser;
@end
