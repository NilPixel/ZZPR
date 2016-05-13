//
//  ZZHomeTopicCell.h
//  HalfSugarism
//
//  Created by Mime97 on 16/5/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZHomeTopic;
@interface ZZHomeTopicCell : UITableViewCell

@property (weak, nonatomic) UIImageView *iconView;

@property (nonatomic, strong) ZZHomeTopic *topic;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
