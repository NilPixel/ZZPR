//
//  ZZTabbarControllerConfig.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZTabbarControllerConfig.h"
#import "ZZTabBarController.h"
@interface ZZTabbarControllerConfig ()

@property (nonatomic, readwrite, strong)ZZTabBarController * tabBarController;

@end

@implementation ZZTabbarControllerConfig

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
