//
//  ZZHomePageHeaderView.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/7.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZHomePageHeaderView;

@protocol ZZHomePageHeaderViewDelegate <NSObject>

@optional
//点击了轮播图
- (void)headerView:(ZZHomePageHeaderView *)headerView didClickBannerViewWithIndex:(NSInteger)index;
//点击了entryList
- (void)headerView:(ZZHomePageHeaderView *)headerView didClickEntryListWithIndex:(NSInteger)index;
//点击了右边的button
- (void)headerViewDidClickRightButton:(ZZHomePageHeaderView *)headerView;
//点击了左边的button
- (void)headerViewDidClickLeftButton:(ZZHomePageHeaderView *)headerView;

@end
@interface ZZHomePageHeaderView : UIView

/**
 *  初始化banner
 *
 *  @param bannerImageArray    图片地址的数组
 *  @param listImageArray      entry实体数组
 */
- (instancetype)initWithBannerImageArray:(NSArray *)bannerImageArray entryListImageArray:(NSArray *)listImageArray;

@property (nonatomic, strong)NSArray *bannerImageArray;
@property (nonatomic, strong)NSArray *listImageArray;
@property (nonatomic,weak)id <ZZHomePageHeaderViewDelegate>delegate;
@end
