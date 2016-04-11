//
//  ZZPageLoadFooterView.h
//  HalfSugarism
//
//  Created by Mime97 on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^FooterRefreshBlock)();

@interface ZZPageLoadFooterView : UIView

+ (instancetype)footerWithRefreshingBlock:(FooterRefreshBlock)footerRefreshBlock;

- (void)startRefreshing;

- (void)endRefreshing;

@end
