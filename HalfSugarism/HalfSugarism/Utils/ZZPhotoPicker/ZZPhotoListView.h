//
//  ZZPhotoListView.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAssetsGroup;
@class ALAsset;

@protocol ZZPhotoListViewProtocol <NSObject>

- (void)tapAction:(ALAsset *)asset;

@end

@interface ZZPhotoListView : UICollectionView
@property (nonatomic, weak) id <ZZPhotoListViewProtocol>my_delegate;
@property (nonatomic, strong) ALAssetsGroup * assetsGroup;
@end
