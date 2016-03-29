//
//  ZZTapAssetView.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAsset;

@protocol ZZTapAssetViewDelegate <NSObject>

//选中
- (void)touchSelect:(BOOL)select;

//是否可选
- (BOOL)shouldTap;

//不可选时进行其他操作
- (void)shouldTapAction;

@end
@interface ZZTapAssetView : UIView
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic,weak) id<ZZTapAssetViewDelegate> delegate;
@end
