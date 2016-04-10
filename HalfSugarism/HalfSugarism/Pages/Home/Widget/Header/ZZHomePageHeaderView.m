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
#import "ZZEntryListCell.h"
#import "ZZNoHLButton.h"
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
    ZZEntryListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.entryList = self.listImageArray[indexPath.item];
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(headerView:didClickEntryListWithIndex:)]) {
        [self.delegate headerView:self didClickEntryListWithIndex:indexPath.item];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake(98, 98);
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(headerView:didClickEntryListWithIndex:)]) {
        [self.delegate headerView:self didClickEntryListWithIndex:index];
    }
}

#pragma mark - event Responser
- (void)leftButtonDidClick
{
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickLeftButton:)]) {
        [self.delegate headerViewDidClickLeftButton:self];
    }
}

- (void)rigthButtonDidClick
{
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickRightButton:)]) {
        [self.delegate headerViewDidClickRightButton:self];
    }
}
#pragma mark - Setter
//设置轮播图图片数组
- (void)setBannerImageArray:(NSArray *)bannerImageArray
{
    _bannerImageArray = bannerImageArray;
    NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
    for (ZZHomeBanner *banner in bannerImageArray) {
        [mutableArray addObject:banner.photo];
    }
    self.cycleScrollView.imageURLStringsGroup = [mutableArray mutableCopy];
}
//设置collectionView的数据源
- (void)setListImageArray:(NSArray *)listImageArray
{
    _listImageArray = listImageArray;
    [self.collectionView reloadData];
}
#pragma mark - Getter
- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_Width, 180) imageURLStringsGroup:@[]];
        _cycleScrollView.delegate = self;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    }
    return _cycleScrollView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.cycleScrollView.frame), CGRectGetWidth(self.cycleScrollView.frame), 128);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        _collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15);
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[ZZEntryListCell class] forCellWithReuseIdentifier:reuseID];
    }
    return _collectionView;
}
- (UIView *)driverLine
{
    if (!_driverLine) {
        _driverLine = [[UIView alloc]init];
        _driverLine.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _driverLine.layer.shadowColor = [UIColor colorWithHexString:@"#eeeeee"].CGColor;
        _driverLine.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    }
    return _driverLine;
}

- (UIView *)leftButtonView
{
    if (!_leftButtonView) {
        _leftButtonView = [UIView new];
        _leftButtonView.backgroundColor = [UIColor colorWithHexString:@"#565937"];
        _leftButtonView.alpha = 0.8;
        _leftButtonView.layer.cornerRadius = 17.0f;
        _leftButtonView.layer.masksToBounds = YES;
        _leftButtonView.frame = CGRectMake(10, 25, 34, 34);
        ZZNoHLButton *leftButton = [[ZZNoHLButton alloc]init];
        [leftButton addTarget:self action:@selector(leftButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setBackgroundImage:[UIImage imageNamed:@"home_search_icon"] forState:UIControlStateNormal];
        leftButton.center  = _leftButtonView.center;
        CGFloat x = (34 - 20)*0.5;
        CGFloat y = (34 - 20)*0.5;
        leftButton.frame = CGRectMake(x, y, 20, 20);
        [_leftButtonView addSubview:leftButton];
    }
    return _leftButtonView;
}

- (UIView *)rightButtonView
{
    if (!_rightButtonView) {
        _rightButtonView = [UIView new];
        _rightButtonView.backgroundColor = [UIColor colorWithHexString:@"#565937"];
        _rightButtonView.alpha = 0.8;
        CGFloat x = kScreen_Width - 10 - 34;
        _rightButtonView.layer.cornerRadius = 17.0f;
        _rightButtonView.layer.masksToBounds = YES;
        _rightButtonView.frame = CGRectMake(x, 25, 34, 34);
        ZZNoHLButton *rightButton = [[ZZNoHLButton alloc]init];
        [rightButton addTarget:self action:@selector(rigthButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setBackgroundImage:[UIImage imageNamed:@"sign_bar_icon"] forState:UIControlStateNormal];
        rightButton.center = _rightButtonView.center;
        CGFloat btnX = (34 - 20)*0.5;
        CGFloat btnY = (34 - 20)*0.5;
        rightButton.frame = CGRectMake(btnX, btnY, 20, 20);
        [_rightButtonView addSubview:rightButton];
    }
    return _rightButtonView;
}
- (void)layoutSubviews
{
    self.driverLine.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

@end
