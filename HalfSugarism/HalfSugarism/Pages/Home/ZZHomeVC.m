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
#define NAVBAR_CHANGE_POINT 50
@interface ZZHomeVC ()<UITableViewDelegate,UITableViewDataSource,ZZHomePageHeaderViewDelegate>
@property (nonatomic, strong)ZZHomePageHeaderView *homePagewHeaderView;
@property (nonatomic, strong)ZZHomePageData *homePageData;
@property (nonatomic, assign)NSInteger page;//当前页码
@property (nonatomic, strong)NSMutableArray *dataArray;//表格列表数据源
@property (nonatomic, strong)

@end

@implementation ZZHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
