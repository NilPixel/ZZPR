//
//  ZZHomePageHeaderView.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/7.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomePageHeaderView.h"
#import <SDCycleScrollView.h>
#import "ZZHomeBanner.h"
static NSString *const reuseID = @"enrtyListCell";

@interface ZZHomePageHeaderView()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UIView *driverLine;
@property (nonatomic, strong)UIView *leftButtonView;
@property (nonatomic, strong)UIView *rightButtonView;

@end
@implementation ZZHomePageHeaderView

- (instancetype)initWithBannerImageArray:(NSArray *)bannerImageArray entryListImageArray:(NSArray *)listImageArray
{
    NSMutableArray *array = [NSMutableArray array];
    for (ZZHomeBanner *banner in bannerImageArray) {
        [array addObject:banner.photo];
    }
    self.bannerImageArray = [array copy];
    //if条件后面如果只有一条语句，则大括号可以省略
    if (listImageArray)self.listImageArray = listImageArray;
    if (self = [super init]) {
        [self addSubview:self.collectionView];
        [self addSubview:self.cycleScrollView];
        [self addSubview:self.driverLine];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listImageArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
