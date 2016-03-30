//
//  ZZPhotoListViewCell.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPhotoListViewCell.h"
#import "ZZTapAssetView.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZZPhotoListViewCell()<ZZTapAssetViewDelegate>
@property (weak, nonatomic) UIImageView * imageView;
@property (weak, nonatomic) ZZTapAssetView * tapAssetView;
@property (strong, nonatomic)ALAsset * asset;
@end
@implementation ZZPhotoListViewCell
- (void)bind:(ALAsset *)asset selectionFliter:(NSPredicate *)selectionFliter isSelected:(BOOL)isSelected
{
    self.asset = asset;
    if (self.imageView == nil) {
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self.contentView addSubview:imageview];
        self.imageView = imageview;
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        self.imageView.layer.cornerRadius = 3.0;
        self.imageView.clipsToBounds = YES;
        self.imageView.backgroundColor = [UIColor whiteColor];
    }
    if (!self.tapAssetView) {
        ZZTapAssetView * tapAssetView = [[ZZTapAssetView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        tapAssetView.delegate = self;
        [self.contentView addSubview:tapAssetView];
        self.tapAssetView = tapAssetView;
    }
    if ([asset isKindOfClass:[UIImage class]]) {
        [self.imageView setImage:(UIImage *)asset];
    }
    else
    {
        [self.imageView setImage:[UIImage imageWithCGImage:asset.aspectRatioThumbnail]];
    }
    
    _tapAssetView.disabled = ![selectionFliter evaluateWithObject:asset];
    _tapAssetView.selected = isSelected;

}

#pragma mark - ZZTapAssetViewDelegate

- (BOOL)shouldTap
{
    if (_delegate && [_delegate respondsToSelector:@selector(shouldSelectAsset:)]) {
        [_delegate shouldSelectAsset:_asset];
    }
    return YES;
}

- (void)touchSelect:(BOOL)select
{
    if (select) {
        if (_delegate && [_delegate respondsToSelector:@selector(didSelectAsset:)]) {
            [_delegate didSelectAsset:_asset];
        }
    }
    else
    {
        if (_delegate && [_delegate respondsToSelector:@selector(didDeselectAsset:)]) {
            [_delegate didDeselectAsset:_asset];
        }
    }
}

- (void)shouldTapAction
{
    if (_delegate && [_delegate respondsToSelector:@selector(tapAction:)]) {
        [_delegate tapAction:_asset];
    }
}

@end
