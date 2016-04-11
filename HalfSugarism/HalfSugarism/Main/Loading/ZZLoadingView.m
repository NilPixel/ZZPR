//
//  ZZLoadingView.m
//  HalfSugarism
//
//  Created by Mime97 on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZLoadingView.h"
@interface ZZLoadingView()

@property (nonatomic, strong)UIImageView *imageView;

@property (nonatomic, strong)NSMutableArray *imagesArray;

@end
@implementation ZZLoadingView

singleton_implementation(ZZLoadingView)

+ (instancetype)loadingViewToView:(UIView *)toView
{
    return [[self alloc]initWithFrame:toView.frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (frame.size.width == 0) {
        frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    }
    CGFloat h = 9.0f;
    CGFloat w = 52.5f;
    CGFloat x = (frame.size.width - w)*0.5;
    CGFloat y = (frame.size.height - h)*0.5;
    self.frame = CGRectMake(x, y, w, h);
    if (self) {
        [self addSubview:self.imageView];
    }
    return self;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame= self.bounds;
    }
    return _imageView;
}

- (void)startAnimation
{
    self.hidden = false;
    if (self.imageView.isAnimating) {
        return;
    }
    self.imageView.animationImages = self.imagesArray;
    self.imageView.animationDuration = 1.0f;
    self.imageView.animationRepeatCount = HUGE;
    [self.imageView startAnimating];

}

- (void)hideAnimation
{
    if (!self.imageView.isAnimating) {
        return;
    }
    self.hidden = true;
    [self.imageView stopAnimating];
    [self.imagesArray removeAllObjects];
    self.imageView = nil;
    self.imagesArray = nil;
}

- (NSMutableArray *)imagesArray
{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray array];
        for (NSInteger index = 1; index<=21; index++) {
            NSString *imageName = [NSString stringWithFormat:@"loading%zd",index];
            UIImage *loadingImage = [UIImage imageNamed:imageName];
            [_imagesArray addObject:loadingImage];
        }
    }
    return _imagesArray;
}
- (void)dealloc
{
    NSLog(@"loadingViewDealloc");
}
@end
