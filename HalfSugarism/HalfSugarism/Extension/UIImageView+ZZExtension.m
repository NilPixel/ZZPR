//
//  UIImageView+ZZExtension.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/9.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "UIImageView+ZZExtension.h"

@implementation UIImageView (ZZExtension)

- (void)fadeImageWithUrl:(NSString *)url
{
    [self yy_setImageWithURL:[NSURL URLWithString:url] placeholder:[UIImage imageNamed:@"default_image"] options:YYWebImageOptionShowNetworkActivity| YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation completion:nil];
}
@end
