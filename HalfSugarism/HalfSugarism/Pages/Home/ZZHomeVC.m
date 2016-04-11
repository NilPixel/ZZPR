//
//  ZZHomeVC.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/7.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomeVC.h"
#import "ZZHomePageHeaderView.h"
#import "ZZHomePageData.h"
#import "ZZLoadingView.h"
#import "ZZPageLoadFooterView.h"
#import "UINavigationBar+Awesome.h"
#import "UIScrollView+PullToRefreshCoreText.h"
#define NAVBAR_CHANGE_POINT 50
@interface ZZHomeVC ()<UITableViewDelegate,UITableViewDataSource,ZZHomePageHeaderViewDelegate>
@property (nonatomic, strong)ZZHomePageHeaderView *homePagewHeaderView;
@property (nonatomic, strong)ZZHomePageData *homePageData;
@property (nonatomic, assign)NSInteger page;//当前页码
@property (nonatomic, strong)NSMutableArray *dataArray;//表格列表数据源
@property (nonatomic, strong)ZZLoadingView *loadingView;//加载loadingView
@property (nonatomic, strong)ZZPageLoadFooterView *pageLoadFooterView;//footerView
@property (nonatomic, assign)BOOL isFinishLoadedData;
@property (nonatomic, assign)CGFloat navigationBarAlpha;

@end

@implementation ZZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar lt_setBackgroundColor:[ZZGobalRedColor colorWithAlphaComponent:_navigationBarAlpha]];
    
    if (self.navigationBarAlpha == 0) {
        [self.navigationItem.titleView setHidden:YES];
        [self.navigationItem.leftBarButtonItem.customView setHidden:YES];
        [self.navigationItem.rightBarButtonItem.customView setHidden:YES];
    }
    [self.navigationItem.titleView setAlpha:self.navigationBarAlpha];
    [self.navigationItem.leftBarButtonItem.customView setAlpha:self.navigationBarAlpha];
    [self.navigationItem.rightBarButtonItem.customView setAlpha:self.navigationBarAlpha];
}

- (void)setUpSubViews
{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem rx_barBtnItemWithNmlImg:@""
                                                                              hltImg:@""
                                                                              target:self
                                                                              action:@selector(searchBtnClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rx_barBtnItemWithNmlImg:@""
                                                                               hltImg:@""
                                                                               target:self
                                                                               action:@selector(signBtnClick)];
    
    [self.navigationItem.titleView setAlpha:0.0];
    [self.navigationItem.leftBarButtonItem.customView setAlpha:0.0];
    [self.navigationItem.rightBarButtonItem.customView setAlpha:0.0];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.loadingView];
    
    __weak typeof(self) weakSelf = self;
    self.pageLoadFooterView = [ZZPageLoadFooterView footerWithRefreshingBlock:^{
        [weakSelf loadDataFromStart:NO];
    }];
    self.pageLoadFooterView.frame = CGRectMake(0, 0, kScreen_Width, 44);
    self.tableView.tableFooterView = self.pageLoadFooterView;
    [self.tableView addPullToRefreshWithPullText:@"C'est La Vie"
                                   pullTextColor:[UIColor colorWithHexString:@"#cb6e76"]
                                    pullTextFont:DefaultTextFont
                                  refreshingText:@"La Vie est belle"
                             refreshingTextColor:[UIColor purpleColor]
                              refreshingTextFont:DefaultTextFont
                                          action:^{
        [weakSelf loadDataFromStart:YES];
    }];
    
}

#pragma mark - event responseder

- (void)searchBtnClick
{
    
}

- (void)signBtnClick
{
    
}

- (void)loadDataFromStart:(BOOL)boolean
{
    if (boolean) {
        self.page = 0;
    }
    
}
@end
