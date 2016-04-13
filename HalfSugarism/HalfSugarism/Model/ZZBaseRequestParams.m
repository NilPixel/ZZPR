//
//  ZZBaseRequestParams.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZBaseRequestParams.h"

@implementation ZZBaseRequestParams

- (instancetype)init
{
    if (self = [super init]) {
        _app_installtime = @"1448947487.584563";
        _app_versions = @"5.0.1";
        _channel_name = @"appStore";
        _client_id = @"bt_app_ios";
        _client_secret = @"9c1e6634ce1c5098e056628cd66a17a5";
        _device_token = @"6a753ca95d9def383f91b8292f297897ef553b6b3474eb0734173d0feb2c761a";
        _oauth_token = @"ebb4ca3078707ea2b89e0e7fbe840cf6";
        _os_versions = @"9.1";
        _pagesize = 20;
        _screensize = 750;
        _track_device_info = @"iPhone8,1";
        _track_deviceid =@"D4A4D7A1-6979-4DD6-ABBE-F6A614835068";
        _track_user_id =@"1628223";
    }
    return self;
}

+ (instancetype)params
{
    return [[self alloc]init];
}
@end
