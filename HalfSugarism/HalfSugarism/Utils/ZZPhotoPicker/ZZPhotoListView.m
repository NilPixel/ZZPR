//
//  ZZPhotoListView.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPhotoListView.h"
#import "ZZPhotoListViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "ZZPhotoGroupViewController.h"
@interface ZZPhotoListView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ZZPhotoListCellDelegate>
@property (strong, nonatomic) NSMutableArray *assets;
@property (nonatomic, strong) NSMutableArray * indexPathsForSelectedItems;
@end
@implementation ZZPhotoListView
#pragma mark - lifecycle

- (instancetype)init
{
    UICollectionViewFlowLayout * flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    [flowLayOut setScrollDirection:UICollectionViewScrollDirectionVertical];
    self = [[ZZPhotoListView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayOut];
    if (self) {
        
    }
    return self;
    
}
- (void)initCommon
{
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[ZZPhotoListViewCell class] forCellWithReuseIdentifier:@"ZZPhotoListViewCell"];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setAssetsGroup:(ALAssetsGroup *)assetsGroup
{
    _assetsGroup = assetsGroup;
}

- (void)setUpAssets
{
    [self.indexPathsForSelectedItems removeAllObjects];
    [self.assets removeAllObjects];
    [self.assets addObject:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"BoPhotoPicker.bundle/images/BoAssetsCamera@2x.png"]]];
    
    ALAssetsGroupEnumerationResultsBlock resultsBlock = ^(ALAsset * asset, NSUInteger index, BOOL *stop)
    {
        if (asset) {
            [self.assets addObject:asset];
        }
        else if (self.assets.count > 0)
        {
            [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
            [self reloadData];
        }
    };
    [self.assetsGroup enumerateAssetsUsingBlock:resultsBlock];

}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"ZZPhotoListViewCell";
    ZZPhotoListViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifer forIndexPath:indexPath];

    BOOL isSelected = [((ZZPhotoGroupViewController *)_my_delegate).indexPathForSelectionItem containsObject:self.assets[indexPath.row]];
    cell.delegate = self;
    [cell bind:self.assets[indexPath.row] selectionFliter:((ZZPhotoGroupViewController *)_my_delegate).selectionFilter isSelected:isSelected];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat wh = (collectionView.bounds.size.width - 20)/3.0;
    
    return CGSizeMake(wh, wh);
}

#pragma mark - ZZPhotoListCellDelegate

- (BOOL)shouldSelectAsset:(ALAsset *)asset
{
    if ([asset isKindOfClass:[UIImage class]]) {
        return NO;
    }
    
    ZZPhotoGroupViewController * vc = (ZZPhotoGroupViewController *)self.my_delegate;
    //单选
    if (!vc.multipleSelection && self.indexPathsForSelectedItems.count == 1) {
        NSInteger index = [self.assets indexOfObject:self.indexPathsForSelectedItems[0]];
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        [self.indexPathsForSelectedItems removeAllObjects];
        [self reloadItemsAtIndexPaths:@[indexPath]];
    }
    
    BOOL selectable = [vc.selectionFilter evaluateWithObject:asset];
    if (self.indexPathsForSelectedItems.count >= vc.maximumNumberOfSelection && ![vc.indexPathForSelectionItem containsObject:asset]) {
        if (vc.delegate && [vc.delegate respondsToSelector:@selector(photoPickerDidMaximum:)]) {
            [vc.delegate photoPickerDidMaximum:vc];
        }
    }
    return (selectable && self.indexPathsForSelectedItems.count < vc.maximumNumberOfSelection);
}

- (void)didSelectAsset:(ALAsset *)asset
{
    [self.indexPathsForSelectedItems addObject:asset];
    
    ZZPhotoGroupViewController * vc = (ZZPhotoGroupViewController *)self.my_delegate;
    vc.indexPathForSelectionItem = self.indexPathsForSelectedItems;
    if (vc.delegate && [vc.delegate respondsToSelector:@selector()]) {
        <#statements#>
    }
}

- (void)didDeselectAsset:(ALAsset *)asset
{
    
}
@end
