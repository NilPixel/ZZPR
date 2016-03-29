//
//  ZZPhotoGroupCell.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPhotoGroupCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ZZPhotoGroupCell()
@property (nonatomic, strong)ALAssetsGroup * assetsGroup;
@property (nonatomic, weak)UIImageView * groupImageView;
@property (nonatomic, weak)UILabel * groupTextLabel;

@end
@implementation ZZPhotoGroupCell

- (void)bind:(ALAssetsGroup *)assetsGroup
{
    self.assetsGroup = assetsGroup;
    self.backgroundColor = mRGBToColor(0xebebeb);
    if (self.groupImageView == nil) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(14, 5, 50, 50)];
        [self.contentView addSubview:imageView];
        self.groupImageView = imageView;
    }
    if (self.groupTextLabel == nil) {
        UILabel * textLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, self.bounds.size.height/2-10, [UIScreen mainScreen].bounds.size.width-70, 20)];
        [self.contentView addSubview:textLabel];
        self.groupTextLabel = textLabel;
    }
    CGImageRef posterImage = assetsGroup.posterImage;
    size_t height = CGImageGetHeight(posterImage);
    float scale = height / 78.0f;
    self.groupImageView.image = [UIImage imageWithCGImage:posterImage scale:scale orientation:UIImageOrientationUp];
    self.groupTextLabel.text = [NSString stringWithFormat:@"%@(%ld)",[assetsGroup valueForProperty:ALAssetsGroupPropertyName],(long)[assetsGroup numberOfAssets]];
    
}

@end
