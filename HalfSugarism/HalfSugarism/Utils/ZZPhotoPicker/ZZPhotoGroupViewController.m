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
@interface ZZPhotoGroupViewController ()<ZZPhotoGroupViewControllerProtocol,ZZPhotoListViewProtocol,ZZPhotoGroupViewProtocol>

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
    UIView * titleView = [[UIView alloc]init];
    titleView.bounds = CGRectMake(0, 0, 200, 64);
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(titleView);
        make.centerY.mas_equalTo(titleView);
    }];
    self.titleLabel = titleLabel;
    
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tapBtn.backgroundColor = [UIColor clearColor];
    [tapBtn addTarget:self action:@selector(selectGroupAction:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:tapBtn];
    [tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(titleLabel.mas_width).offset(50);
        make.centerX.mas_equalTo(titleView);
        make.centerY.mas_equalTo(titleView);
        make.height.mas_equalTo(@44);
    }];
    
    //selectTipImageView
    UIImageView * selectTip = [[UIImageView alloc]init];
    selectTip.image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"BoPhotoPicker.bundle/images/BoSelectGroup_tip@2x.png"]];
    [titleView addSubview:selectTip];
    [selectTip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(titleLabel.mas_trailing).offset(10);
        make.width.mas_equalTo(@8);
        make.height.mas_equalTo(@5);
        make.centerY.mas_equalTo(titleLabel);
    }];
    self.selectedTip = selectTip;
    self.navigationItem.titleView = titleView;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rx_barBtnItemWithTitle:@"确定"
                                                                          titleColor:[UIColor whiteColor]
                                                                           titleFont:[UIFont systemFontOfSize:15] target:self
                                                                              action:@selector(okBtnAction:)];
}


- (void)setUpPhotoListView
{
    ZZPhotoListView * collectionView = [[ZZPhotoListView alloc]init];
    collectionView.my_delegate = self;
    collectionView.frame = self.view.bounds;
    [self.view addSubview:collectionView];
    self.photoListView = collectionView;
}

- (void)setUpGroupView
{
    ZZPhotoGroupView * photoGroupView = [[ZZPhotoGroupView alloc]init];
    photoGroupView.assetsFilter = self.assetsFilter;
    photoGroupView.my_deleagte = self;
    [self.view addSubview:photoGroupView];
    self.photoGroupView = photoGroupView;
    photoGroupView.hidden = YES;
    [photoGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(-360);
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(@360);
    }];
    
}

- (void)setUpData
{
    [self.photoGroupView setUpGroup];
}
#pragma mark - Action
- (void)cancelBtnAction:(UIButton *)sender
{
    
}

#pragma mark - 相册切换
- (void)selectGroupAction:(UIButton *)sender
{
    //无权限
    if (self.isNotAllowed) {
        return;
    }
    if (self.photoGroupView.hidden) {
        [self bgMaskView];
        self.photoGroupView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            self.photoGroupView.transform = CGAffineTransformMakeTranslation(0, 360);
            self.selectedTip.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }
    else
    {
        [self ]
    }
    
}

- (void)okBtnAction:(UIButton *)sender
{
    
}
@end
