//
//  ZZDataBaseManager.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/19.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZZHomePageData,ZZHomeBanner;
@interface ZZDataBaseManager : NSObject

+ (ZZDataBaseManager *)shareInstance;
/** 插入homePageData */
- (void)insertHomePageDataToDB:(ZZHomePageData *)pageData page:(NSInteger)page;
/** 获取homePageData */
- (ZZHomePageData *)getPageDataWithPage:(NSInteger)page;
/** 插入bannerData */
- (void)inserthomeBannerDataToDB:(NSArray *)pageDataArray;
/** 获取bannerData */
- (NSArray *)getbannerData;

@end
