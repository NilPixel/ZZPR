//
//  ZZEntryListCell.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/8.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZEntryListCell.h"
#import "ZZEntryList.h"
#import <UIImageView+WebCache.h>
#import "UIImageView+ZZExtension.h"
@interface ZZEntryListCell()
@property (nonatomic, weak)UIImageView *imageView;
@end
@implementation ZZEntryListCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (void)setEntryList:(ZZEntryList *)entryList
{
    _entryList = entryList;
    [self.imageView fadeImageWithUrl:entryList.pic1];
}
@end
