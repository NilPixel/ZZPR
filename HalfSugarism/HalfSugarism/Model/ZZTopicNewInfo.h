//
//  ZZTopicNewInfo.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Activity,ZZProduct;
@interface ZZTopicNewInfo : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger category;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *tagIds;

@property (nonatomic, copy) NSString *sharePic;

@property (nonatomic, copy) NSString *shareUrl;
/** 头像地址域名 */
@property (nonatomic, copy) NSString *userAvatrHost;
/** 产品图片地址域名 */
@property (nonatomic, copy) NSString *productPicHost;

@property (nonatomic, strong) Activity *activity;

@property (nonatomic, assign) BOOL islike;

@property (nonatomic, strong) NSArray *product;

@end
@interface Activity : NSObject

@end