//
//  ZZPhotoGroupViewController.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPhotoGroupViewController.h"
#import "ZZPhotoGroupView.h"
#import "Masonry.h"
#import "ZZPhotoListView.h"
@interface ZZPhotoGroupViewController ()<ZZPhotoGroupViewControllerProtocol>

@property (nonatomic, weak) ZZPhotoGroupView *photoGroupView;
@property (nonatomic, weak) UILabel * titleLabel;
@property (nonatomic, weak) UIView * navBar;
@property (nonatomic, weak) UIView * bgMaskView;
@property (nonatomic, weak) ZZPhotoListView * photoListView;
@property (nonatomic, weak) UIImageView * selectedTip;
@property (nonatomic, weak) UIButton * okButton;
@property (nonatomic)BOOL isNotAllowed;
@end

@implementation ZZPhotoGroupViewController

#pragma mark - init
- (instancetype)init
{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor blueColor];
        _maximumNumberOfSelection = 10;
        _minimumNumberOfSelection = 0;
        _assetsFilter = [ALAssetsFilter allAssets];
        _showEmptyGroups = NO;
        _selectionFilter = [NSPredicate predicateWithValue:YES];
    }
    return self;
}
#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    NSLog(@"%s",__func__);
}

#pragma mark - 界面初始化

- (void)setUpNavBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem rx_barBtnItemWithTitle:@"取消"
                                                                         titleColor:[UIColor whiteColor]
                                                                          titleFont:[UIFont systemFontOfSize:15]
                                                                             target:self action:@selector(cancelBtnAction:)];
}
@end
