//
//  ZZNavigationController.m
//  HalfSugarism
//
//  Created by Mime97 on 16/5/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZNavigationController.h"
#import "RMPZoomTransitionAnimator.h"
@interface ZZNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation ZZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)initialize
{
    [self setupNavBarTheme];
}
+ (void)setupNavBarTheme
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    backgroundImage = [UIImage rx_captureImageWithImageName:@"nav_backgroud"];
    
    textAttributes = @{
                       NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                       NSForegroundColorAttributeName: [UIColor whiteColor],
                       };
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >0) {
        UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tb_icon_navigation_back"]
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(clickBackBarButton:)];
        viewController.navigationItem.leftBarButtonItem = backBarButtonItem;
        [viewController setHidesBottomBarWhenPushed:animated];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)clickBackBarButton:(UIBarButtonItem *)item
{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        [self popViewControllerAnimated:YES];
    }
    else
    {
        [self popToRootViewControllerAnimated:YES];
    }
}
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    id <RMPZoomTransitionAnimating, RMPZoomTransitionDelegate> sourceTransition =
    (id<RMPZoomTransitionAnimating, RMPZoomTransitionDelegate>)fromVC;
    
    id <RMPZoomTransitionAnimating, RMPZoomTransitionDelegate> destinationTransition =
    (id<RMPZoomTransitionAnimating, RMPZoomTransitionDelegate>)toVC;
    
    if ([sourceTransition conformsToProtocol:@protocol(RMPZoomTransitionAnimating)] &&
        [destinationTransition conformsToProtocol:@protocol(RMPZoomTransitionAnimating)]) {
        RMPZoomTransitionAnimator *animator = [[RMPZoomTransitionAnimator alloc] init];
        animator.goingForward = (operation == UINavigationControllerOperationPush);
        animator.sourceTransition = sourceTransition;
        animator.destinationTransition = destinationTransition;
        return animator;
    }
    return nil;
}
@end
