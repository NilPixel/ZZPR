//
//  ZZTabbarControllerConfig.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZTabbarControllerConfig.h"
#import "ZZHomePushTransitionVC.h"
#import "ZZNavigationController.h"
#import "ZZProfileVC.h"
#import "ZZMessageVC.h"
#import "ZZCommunityVC.h"
@interface ZZTabbarControllerConfig ()

@property (nonatomic, readwrite, strong)ZZTabBarController * tabBarController;

@end

@implementation ZZTabbarControllerConfig

- (ZZTabBarController *)tabBarController
{
    if (!_tabBarController) {
        ZZHomePushTransitionVC *homeVC = [[ZZHomePushTransitionVC alloc]init];
        homeVC.title = @"首页";
        ZZNavigationController *firstNavigationController = [[ZZNavigationController alloc]initWithRootViewController:homeVC];
        
        ZZCommunityVC *communityVC = [[ZZCommunityVC alloc]init];
        homeVC.title = @"发现";
        ZZNavigationController *secondNavigationController = [[ZZNavigationController alloc]initWithRootViewController:communityVC];
        
        ZZMessageVC *messageVC = [[ZZMessageVC alloc]init];
        homeVC.title = @"消息";
        ZZNavigationController *thirdNavigationController = [[ZZNavigationController alloc]initWithRootViewController:messageVC];
        
        ZZProfileVC *profileVC = [[ZZProfileVC alloc]init];
        homeVC.title = @"我";
        ZZNavigationController *fourthNavigationController = [[ZZNavigationController alloc]initWithRootViewController:profileVC];
        ZZTabBarController *tabbarController = [[ZZTabBarController alloc]init];
        
    }
}
/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController:(BTTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"",
                            CYLTabBarItemImage : @"tab_首页",
                            CYLTabBarItemSelectedImage : @"tab_首页_pressed",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"",
                            CYLTabBarItemImage : @"tab_社区",
                            CYLTabBarItemSelectedImage : @"tab_社区_pressed",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"",
                            CYLTabBarItemImage : @"tab_分类",
                            CYLTabBarItemSelectedImage : @"tab_分类_pressed",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"",
                            CYLTabBarItemImage : @"tab_我的",
                            CYLTabBarItemSelectedImage : @"tab_我的_pressed"
                            };
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4 ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    
    [self setUpTabBarItemTextAttributes];
}
/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = BTGobalRedColor;
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tab_bar_bg"]];
}
@end
