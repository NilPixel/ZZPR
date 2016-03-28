//
//  ZZTabBarController.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZTabBarController.h"
NSUInteger ZZTabBarItemsCount = 0;
@interface UIViewController (ZZTabBarControllerItemInternal)

- (void)zz_setTabBarController:(ZZTabBarController*)tabBarcontroller;

@end

@interface ZZTabBarController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation ZZTabBarController
@synthesize viewControllers = _viewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpTabBar
{
    
}

@end
