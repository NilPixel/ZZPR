//
//  ZZPageLoadFooterView.m
//  HalfSugarism
//
//  Created by Mime97 on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPageLoadFooterView.h"
@interface ZZPageLoadFooterView()
@property (nonatomic, weak)UIView *logoView;
@property (nonatomic, weak)UIImageView *footerLogoView;
@property (nonatomic, weak)UIImageView *animationView;
@property (nonatomic, copy)FooterRefreshBlock footerRefreshBlock;
@end
@implementation ZZPageLoadFooterView

+ (instancetype)footerWithRefreshingBlock:(FooterRefreshBlock)footerRefreshBlock
{
    ZZPageLoadFooterView *footerView = [[self alloc]init];
    footerView.footerRefreshBlock = footerRefreshBlock;
    return footerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0) {
        frame = CGRectMake(0, 0, kScreen_Width, 44);
    }
    if (self = [super initWithFrame:frame]) {
        UIView *logoView = [UIView new];
        [self addSubview:logoView];
        logoView.frame = CGRectMake(0, 0, kScreen_Width, 44);
        self.logoView = logoView;
        
        UIImageView *footerLogoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        CGFloat logoW = 181;
        CGFloat logoH = 22;
        CGFloat logoX = (kScreen_Width - logoW) *0.5;
        CGFloat logoY = (44 - logoH) *0.5;
        footerLogoView.frame = CGRectMake(logoX, logoY, logoW, logoH);
        [self.logoView addSubview:footerLogoView];
        self.footerLogoView = footerLogoView;
        
        UIImageView *animationView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        [self addSubview:animationView];
        animationView.center = logoView.center;
        animationView.bounds = CGRectMake(0, 0, 10, 10);
        self.animationView =animationView;
    }
    return self;
}

- (void)startRefreshing
{
    [self.logoView setHidden:YES];
    
    self.animationView.hidden = false;
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = 0;
    rotate.toValue = @(M_PI * 2);
    rotate.duration = 0.75;
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotate.repeatCount = HUGE;
    rotate.fillMode = kCAFillModeForwards;
    rotate.removedOnCompletion = false;
    [self.animationView.layer addAnimation:rotate forKey:@"animation"];
    if (self.footerRefreshBlock) {
        self.footerRefreshBlock();
    }
}

- (void)endRefreshing
{
    [self.logoView setHidden:NO];
    
    self.animationView.hidden = true;
    
    [self.animationView.layer removeAllAnimations];
}
@end
