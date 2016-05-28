//
//  ZZHomePushTransitionVC.m
//  HalfSugarism
//
//  Created by Mime97 on 16/5/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomePushTransitionVC.h"
#import "ZZHomeTopicCell.h"
@interface ZZHomePushTransitionVC ()

@end

@implementation ZZHomePushTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIImageView *)transitionSourceImageView
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    ZZHomeTopicCell *cell = (ZZHomeTopicCell *)[self.tableView cellForRowAtIndexPath:selectedIndexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cell.iconView.image];
    imageView.contentMode = cell.imageView.contentMode;
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = NO;
    imageView.frame = [cell.iconView convertRect:cell.iconView.frame toView:self.tableView.superview];
    CGRect tmp = imageView.frame;
    tmp.size = CGSizeMake(kScreen_Width, 200);
    imageView.frame = tmp;
    return imageView;
}
- (UIColor *)transitionSourceBackgroundColor
{
    return self.tableView.backgroundColor;
}

- (CGRect)transitionDestinationImageViewFrame
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    ZZHomeTopicCell *cell = (ZZHomeTopicCell *)[self.tableView cellForRowAtIndexPath:selectedIndexPath];
    CGRect cellFrameInSuperview = [cell.iconView convertRect:cell.iconView.frame toView:self.tableView.superview];
    return cellFrameInSuperview;
}
@end
