//
//  ZZTapAssetView.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZTapAssetView.h"
@interface ZZTapAssetView ()

@property (nonatomic,strong)UIImageView * selectView;

@end

@implementation ZZTapAssetView
static UIImage * checkedIcon;
static UIColor * selectedColor;
static UIColor * disabledColor;

+ (void)initialize
{
    checkedIcon = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"BoPhotoPicker.bundle/images/BoAssetsPickerChecked@2x.png"]];
    selectedColor = [UIColor colorWithWhite:1 alpha:0.3];
    disabledColor = [UIColor colorWithWhite:1 alpha:0.8];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-checkedIcon.size.width-5, frame.size.height-checkedIcon.size.height-5, checkedIcon.size.width, checkedIcon.size.height)];
        [self addSubview:_selectView];
    }
    return self;
}
@end
