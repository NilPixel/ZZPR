//
//  ZZWebViewVC.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/5/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZWebViewVC.h"

@interface ZZWebViewVC ()
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation ZZWebViewVC

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
- (void)setIsModelStyle:(BOOL)isModelStyle
{
    _isModelStyle = isModelStyle;
    if (self.isModelStyle) {
        UIBarButtonItem *cancelItem = [UIBarButtonItem rx_barBtnItemWithNmlImg:@"Login_close_btn" hltImg:@"Login_close_btn" target:self action:@selector(backButtonDidClicked)];
        self.navigationItem.rightBarButtonItem = cancelItem;
        self.navigationItem.leftBarButtonItem = nil;
    }
    else
    {
        UIBarButtonItem *shareItem = [UIBarButtonItem rx_barBtnItemWithNmlImg:@"share_item_icon" hltImg:@"share_item_icon" target:self action:@selector(shareItemDidClicked)];
        self.navigationItem.rightBarButtonItem = shareItem;
    }
}
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        _webView.scalesPageToFit = YES;
        _webView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-64);
    }
    return _webView;
}
- (void)setUrl:(NSString *)url
{
    _url = url;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}
- (void)backButtonDidClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)shareItemDidClicked
{
    
}
@end
