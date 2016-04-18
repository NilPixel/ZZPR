//
//  ZZListPost.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZListPostDynamic,ZZSubjectAuthor,ZZProduct,ZZTag,ZZListPostPics;

@interface ZZListPost : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *relationId;

@property (nonatomic, copy) NSString *isRecommend;

@property (nonatomic, strong) ZZSubjectAuthor *author;

@property (nonatomic, copy) NSString *datestr;

@property (nonatomic, strong) NSArray<ZZProduct *> *product;

@property (nonatomic, strong) NSArray<ZZTag *> *tags;

@property (nonatomic, strong) ZZListPostDynamic *dynamic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *authorId;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *iTags;

@property (nonatomic, strong) NSArray<ZZListPostPics *> *pics;

@property (nonatomic, copy) NSString *content;

@end
