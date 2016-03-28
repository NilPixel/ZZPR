//
//  ZZTabBarController.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//


@import Foundation;

static NSString * const ZZTabBarItemTitle=@"tabBarItemTitle";
static NSString * const ZZTabBarItemImage=@"tabBarItemImage";
static NSString * const ZZTabBarItemSelectedImage=@"tabBarItemSelectedImage";
extern NSUInteger ZZTabBarItemsCount;

#import <UIKit/UIKit.h>

@interface ZZTabBarController : UITabBarController

@property (nonatomic, readwrite, copy)IBOutletCollection(UIViewController)NSArray * viewControllers;

@property (nonatomic, readwrite, copy)IBOutletCollection(NSDictionary)NSArray * tabBarItemsAttributes;

@end

@interface UIViewController (ZZTabBarController)

@property (nonatomic, readonly)ZZTabBarController * zz_tabBarController;

@end
