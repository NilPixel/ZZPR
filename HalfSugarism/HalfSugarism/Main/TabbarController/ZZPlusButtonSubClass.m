//
//  ZZPlusButtonSubClass.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPlusButtonSubClass.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ZZTabBarController.h"
@interface ZZPlusButtonSubClass () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    CGFloat _buttonImageHeight;
}
@end

@implementation ZZPlusButtonSubClass
#pragma mark -
#pragma mark - Life Cycle

+ (void)load
{
    [super registerSubClass];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark -
#pragma mark - Public Methods
+ (instancetype)plusButton
{
    UIImage * buttonImage = [UIImage imageNamed:@"tab_publish_add"];

    UIImage * heightLightImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    UIImage * iconImage = [UIImage imageNamed:@"tab_publish_add"];
    UIImage * heightLightIconImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    ZZPlusButtonSubClass * button = [ZZPlusButtonSubClass buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setImage:heightLightIconImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:heightLightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)clickPublish
{
    
}
@end
