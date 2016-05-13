//
//  ZZHomeTopicCell.m
//  HalfSugarism
//
//  Created by Mime97 on 16/5/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomeTopicCell.h"
#import "ZZHomeTopic.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import "ZZNoHLButton.h"
@interface ZZHomeTopicCell()

@property (weak, nonatomic)  ZZNoHLButton *likeButton;

@property (weak, nonatomic)  UILabel *titleLabel;

@end
@implementation ZZHomeTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"topicCell";
    ZZHomeTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[ZZHomeTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(200);
        }];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = BTFont(16);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor colorWithHexString:@"#777777"];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.iconView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(kScreen_Width, 36));
        }];
        
        ZZNoHLButton *likeButton = [[ZZNoHLButton alloc] init];
        likeButton.titleLabel.font = BTFont(13);
        [likeButton setImage:[UIImage imageNamed:@"home_likes_icon"] forState:UIControlStateNormal];
        [likeButton setTitleColor:[UIColor colorWithHexString:@"#c9c9c9"] forState:UIControlStateNormal];
        [self.contentView addSubview:likeButton];
        self.likeButton = likeButton;
        [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(kScreen_Width, 28));
        }];
    }
    return self;
}

- (void)setTopic:(ZZHomeTopic *)topic
{
    _topic = topic;
    
    [self.iconView fadeImageWithUrl:topic.pic];
    
    self.titleLabel.text = topic.title;
    
    [self.likeButton setTitle:topic.likes forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
@end
