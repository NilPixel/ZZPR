//
//  ZZPhotoListViewCell.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAsset;

@protocol ZZPhotoListCellDelegate <NSObject>

//每次点击的相关方法
- (BOOL)shouldSelectAsset:(ALAsset *)asset;
- (BOOL)didSelectAsset:(ALAsset *)asset;
- (BOOL)didDeselectAsset:(ALAsset *)asset;

//特殊的cell点击操作
- (void)tapAction:(ALAsset *)asset;
@end

@interface ZZPhotoListViewCell : UICollectionViewCell

@property (weak, nonatomic) id<ZZPhotoListCellDelegate>delegate;

- (void)bind:(ALAsset *)asset selectionFliter:(NSPredicate *)selectionFliter isSelected:(BOOL)isSelected;

@end
