//
//  ZZProduct.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/16.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZZProductPic,ZZProductLiker;

@interface ZZProduct : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *itemId;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) BOOL islike;

@property (nonatomic, assign) BOOL iscomments;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, strong) NSArray *picArray;

@property (nonatomic, strong) NSArray *likesList;

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, copy) NSString *likes;

@end

@interface ZZProductPic : NSObject
/** 宽 */
@property (nonatomic, assign) NSInteger w;
/** 高 */
@property (nonatomic, assign) NSInteger h;
/** url地址 */
@property (nonatomic, copy) NSString *p;

@end

@interface ZZProductLiker : NSObject
/** userId */
@property (nonatomic, assign) NSInteger u;
/** 头像url */
@property (nonatomic, copy) NSString *a;

@end

