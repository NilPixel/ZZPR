//
//  ZZPhotoGroupCell.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAssetsGroup;

@interface ZZPhotoGroupCell : UITableViewCell

- (void)bind:(ALAssetsGroup *)assetsGroup;

@end
