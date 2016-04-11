//
//  ZZLoadingView.h
//  HalfSugarism
//
//  Created by Mime97 on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZLoadingView : UIView
singleton_interface(ZZLoadingView)

+ (instancetype)loadingViewToView:(UIView *)toView;

- (void)startAnimation;

- (void)hideAnimation;

@end
