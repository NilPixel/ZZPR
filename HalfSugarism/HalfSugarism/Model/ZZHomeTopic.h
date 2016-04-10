//
//  ZZHomeTopic.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/10.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZHomeTopic : NSObject
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, assign) NSInteger tid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic, assign) BOOL isLike;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *type;
@end
