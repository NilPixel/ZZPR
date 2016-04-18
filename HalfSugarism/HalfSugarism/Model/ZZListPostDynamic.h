//
//  ZZListPostDynamic.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZListPostDynamic : NSObject

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, strong) NSArray *likesUsers;

@property (nonatomic, assign) BOOL isComment;

@property (nonatomic, copy) NSString *praises;

@property (nonatomic, copy) NSString *views;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, assign) BOOL isCollect;

@end
