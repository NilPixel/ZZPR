//
//  ZZCommunitySubject.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZZSubjectDynamic,ZZSubjectAuthor;
@interface ZZCommunitySubject : NSObject
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *pic1;
/** header图片 */
@property (nonatomic, copy) NSString *pic2;

@property (nonatomic, strong) ZZSubjectAuthor *author;

@property (nonatomic, strong) ZZSubjectDynamic *dynamic;

@property (nonatomic, copy) NSString *datestr;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *rankShareUrl;

@property (nonatomic, copy) NSString *authorId;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, copy) NSString *isRecommend;

@end
