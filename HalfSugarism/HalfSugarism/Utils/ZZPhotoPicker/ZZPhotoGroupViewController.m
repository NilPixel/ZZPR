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
    if ([_delegate respondsToSelector:@selector(photoPickerDidCancel:)]) {
        [_delegate photoPickerDidCancel:self];
    }
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
        [self hidenGroupView];
    }
    
}

- (void)hidenGroupView
{
    [self.bgMaskView removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        self.photoGroupView.transform = CGAffineTransformIdentity;
        self.selectedTip.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.photoGroupView.hidden = YES;
    }];
    
}

#pragma mark - ZZPhotoGroupViewProtocol
- (void)didSelectGroup:(ALAssetsGroup *)assetsGroup
{
    self.photoListView.assetsGroup = assetsGroup;
    self.titleLabel.text = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    [self hidenGroupView];
}

#pragma mark - ZZPhotoListViewProtocol

- (void)tapAction:(ALAsset *)asset
{
    if ([asset isKindOfClass:[UIImage class]]&&_delegate&&[_delegate respondsToSelector:@selector(photoPickerTapAction:)]) {
        [_delegate photoPickerTapAction:self];
    }
}
- (void)okBtnAction:(UIButton *)sender
{
    if (self.minimumNumberOfSelection>self.indexPathForSelectionItem.count
        ) {
        if (_delegate&&[_delegate respondsToSelector:@selector(photoPickerDidMinimum:)]) {
            [_delegate photoPickerDidMinimum:self];
        }
    }
    else
    {
        if (_delegate && [_delegate respondsToSelector:@selector(photoPicker:didSelectAssets:)]) {
            [_delegate photoPicker:self didSelectAssets:self.indexPathForSelectionItem];
        }
    }
    
}
#pragma mark - 遮罩背景
- (UIView *)bgMaskView
{
    if (_bgMaskView == nil) {
        UIView * bgMaskView = [[UIView alloc]init];
        bgMaskView.alpha = 0.4;
        bgMaskView.backgroundColor = [UIColor blackColor];
        [self.view insertSubview:bgMaskView aboveSubview:self.photoListView];
        bgMaskView.userInteractionEnabled = YES;
        [bgMaskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgMaskView:)]];
        [bgMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view);
            make.leading.mas_equalTo(self.view);
            make.trailing.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view);
        }];
        _bgMaskView = bgMaskView;
    }
    return _bgMaskView;
}

- (void)tapBgMaskView:(UITapGestureRecognizer*)sender
{
    if (!self.photoGroupView.hidden) {
        [self hidenGroupView];
    }
}

#pragma mark - 没有访问权限

- (void)showNotAllowed
{
    //没有权限时隐藏部分控件
    self.isNotAllowed = YES;
    self.selectedTip.hidden = YES;
    self.titleLabel.text = @"无权限访问相册";
    self.okButton.hidden = YES;
    UIAlertView *alert;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                           message:@"请在iPhone的“设置”-“隐私”-“照片”中，找到波波网更改"
                                          delegate:nil
                                 cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil, nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                           message:@"请先允许访问照片"
                                          delegate:self
                                 cancelButtonTitle:@"取消"
                                 otherButtonTitles:@"前往", nil];
    }
    [alert show];
}

- (void)alertview:(UIAlertView *)alertView clickAtButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    
}

#pragma mark - getter/setter

- (NSMutableArray*)indexPathForSelectionItem
{
    if (!_indexPathForSelectionItem) {
        _indexPathForSelectionItem = [[NSMutableArray alloc]init];
    }
    return _indexPathForSelectionItem;
}
@end
