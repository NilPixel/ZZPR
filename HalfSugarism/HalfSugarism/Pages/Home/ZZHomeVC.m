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
#import "ZZHomePageManager.h"
#import "ZZLoadingView.h"
#import "ZZPageLoadFooterView.h"
#import "UINavigationBar+Awesome.h"
#import "UIScrollView+PullToRefreshCoreText.h"
#import "ZZDataBaseManager.h"
#import "ZZHomeTopicCell.h"
#import "ZZHomeTopic.h"
#import "ZZProductListVC.h"
#import "ZZHomeBanner.h"
#import "ZZTopicListVC.h"
#import "ZZWebViewVC.h"
#import "ZZEntryList.h"
#import "ZZSubjectVC.h"
#import "ZZSubscribeVC.h"
#define NAVBAR_CHANGE_POINT 50
@interface ZZHomeVC ()<UITableViewDelegate,UITableViewDataSource,ZZHomePageHeaderViewDelegate>
@property (nonatomic, strong)ZZHomePageHeaderView *homePagewHeaderView;
@property (nonatomic, strong)ZZHomePageData *homePageData;
@property (nonatomic, assign)NSInteger page;//当前页码
@property (nonatomic, strong)NSMutableArray *dataArray;//表格列表数据源
@property (nonatomic, strong)ZZLoadingView *loadingView;//加载loadingView
@property (nonatomic, strong)ZZPageLoadFooterView *pageLoadFooterView;//footerView
@property (nonatomic, assign)BOOL isFinishLoadedData;
/** navigationBar的alpha值 */
@property (nonatomic, assign)CGFloat navigationBarAlpha;

@end

@implementation ZZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubViews];
    [self loadDataFromStart:YES];
    
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
- (void)loadDataFromStart:(BOOL)boolean
{
    if (boolean) {
        self.page = 0;
    }
        [ZZHomePageManager getHomePageDataWithPage:self.page successHandler:^(ZZHomePageData *pageData) {
            [[ZZDataBaseManager shareInstance] insertHomePageDataToDB:pageData page:self.page];
            [self hideLoading];
            if (boolean) {
                [self.dataArray removeAllObjects];
                self.homePageData = pageData;
                self.homePagewHeaderView.bannerImageArray = pageData.banner;
                self.homePagewHeaderView.listImageArray = pageData.entryList;
            }
            if (pageData.topic.count == 0) {
                return ;
            }
            self.isFinishLoadedData = pageData.topic.count < 10;
            [self.dataArray addObjectsFromArray:pageData.topic];
            [self.tableView setHidden:NO];
            [self.tableView reloadData];
            self.page++;
        } failureHandler:^(NSError *error) {
            [self hideLoading];
        }];
}
#pragma mark - event responseder

- (void)searchBtnClick
{
    
}

- (void)signBtnClick
{
    
}

- (void)hideLoading
{
    [self.loadingView hideAnimation];
    [self.tableView finishLoading];
    [self.pageLoadFooterView endRefreshing];
}
- (ZZHomePageHeaderView *)homePagewHeaderView
{
    if (!_homePagewHeaderView) {
        _homePagewHeaderView = [[ZZHomePageHeaderView alloc]initWithBannerImageArray:nil entryListImageArray:self.homePageData.entryList];
        _homePagewHeaderView.frame = CGRectMake(0, 0, kScreen_Width, 308);
        _homePagewHeaderView.delegate = self;
        [self.view addSubview:_homePagewHeaderView];
    }
    return _homePagewHeaderView;
}
#pragma mark - tableView DataSource && tableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZHomeTopicCell *cell = [ZZHomeTopicCell cellWithTableView:tableView];
    cell.topic = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZHomeTopic *topic = self.dataArray[indexPath.row];
    ZZProductListVC *productListVC = [[ZZProductListVC alloc] init];
    productListVC.extendID = [NSString stringWithFormat:@"%zd",topic.tid];
    [self.navigationController pushViewController:productListVC animated:YES];
}
// 用于加载更多
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.dataArray.count - 1) {
        if (self.isFinishLoadedData) return;
        [self.pageLoadFooterView startRefreshing];
    }
}
#pragma mark - BTHomePageHeaderViewDelegate
- (void)headerView:(ZZHomePageHeaderView *)headerView didClickBannerViewWithIndex:(NSInteger)index
{
    ZZHomeBanner *banner = self.homePageData.banner[index];
    if (![banner.type isEqualToString:@"webview"]) {
        ZZTopicListVC *listVC = [[ZZTopicListVC alloc] init];
        listVC.extend = banner.extend;
        listVC.title = banner.title;
        [self.navigationController pushViewController:listVC animated:YES];
    }else if ([banner.type isEqualToString:@"webview"])
    {
        ZZWebViewVC *webViewVC = [[ZZWebViewVC alloc] init];
        webViewVC.url = banner.extend;
        webViewVC.title = banner.title;
        webViewVC.isModelStyle = NO;
        [self.navigationController pushViewController:webViewVC animated:YES];
    }
}

- (void)headerView:(ZZHomePageHeaderView *)headerView didClickEntryListWithIndex:(NSInteger)index
{
    ZZEntryList *entryList = self.homePageData.entryList[index];
    ZZSubjectVC *subjectVC = [[ZZSubjectVC alloc] init];
    if (entryList.extend.length) {
        subjectVC.extendId = [entryList.extend integerValue];
        [self.navigationController pushViewController:subjectVC animated:YES];
    }
}

- (void)headerViewDidClickLeftButton:(ZZHomePageHeaderView *)headerView
{
    ZZSubscribeVC *subscribeVC = [[ZZSubscribeVC alloc] init];
    [self.navigationController pushViewController:subscribeVC animated:YES];
}

- (void)headerViewDidClickRightButton:(ZZHomePageHeaderView *)headerView
{
    
}
#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 100开始显示
    // 180显示完全
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = 0;
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
    }
    
    if (alpha>0) {
        [self.navigationItem.titleView setHidden:NO];
        [self.navigationItem.leftBarButtonItem.customView setHidden:NO];
        [self.navigationItem.rightBarButtonItem.customView setHidden:NO];
    }
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[ZZGobalRedColor colorWithAlphaComponent:alpha]];
    [self.navigationItem.titleView setAlpha:alpha];
    [self.navigationItem.leftBarButtonItem.customView setAlpha:alpha];
    [self.navigationItem.rightBarButtonItem.customView setAlpha:alpha];
    self.navigationBarAlpha = alpha;
}

#pragma mark - getter Method
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 264;
        _tableView.height -= 49;
        _tableView.tableHeaderView = self.homePagewHeaderView;
        [_tableView setHidden:YES];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (ZZLoadingView *)loadingView
{
    if (!_loadingView) {
        _loadingView = [ZZLoadingView loadingViewToView:self.view];
        [_loadingView startAnimation];
    }
    return _loadingView;
}
@end
