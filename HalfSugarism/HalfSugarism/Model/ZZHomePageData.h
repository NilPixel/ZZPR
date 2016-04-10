//
//  ZZHomePageData.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/10.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZHomePageData : NSObject
@property (nonatomic, strong) NSArray *topic;
@property (nonatomic, strong) NSArray *categoryElement;
@property (nonatomic, strong) NSArray *firstPageElement;
@property (nonatomic, copy) NSString *today;
@property (nonatomic, strong) NSArray *entryList;
@property (nonatomic, copy)NSString *dateLine;
@property (nonatomic, strong)NSNumber *signEntry;
@property (nonatomic, assign)BOOL isBaiChuan;
@property (nonatomic, strong)NSArray *banner;

@end
