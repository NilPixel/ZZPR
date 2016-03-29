//
//  ZZPhotoGroupView.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAssetsGroup;
@class ALAssetsFilter;

@protocol ZZPhotoGroupViewProtocol <NSObject>

- (void)didSelectGroup:(ALAssetsGroup *)assetsGroup;

@end
@interface ZZPhotoGroupView : UITableView
@property (weak, nonatomic) id<ZZPhotoGroupViewProtocol> my_deleagte;
@property (nonatomic, strong) ALAssetsFilter * assetsFilter;
@property (nonatomic) NSInteger selectIndex;
//显示
- (void)setUpGroup;
@end
