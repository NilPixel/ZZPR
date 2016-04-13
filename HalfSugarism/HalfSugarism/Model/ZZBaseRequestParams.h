//
//  ZZBaseRequestParams.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/13.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZBaseRequestParams : NSObject
@property (nonatomic, copy, readonly) NSString *app_installtime;
@property (nonatomic, copy, readonly) NSString *app_versions;
@property (nonatomic, copy, readonly) NSString *channel_name;
@property (nonatomic, copy, readonly) NSString *client_id;
@property (nonatomic, copy, readonly) NSString *client_secret;
@property (nonatomic, copy, readonly) NSString *device_token;
@property (nonatomic, copy, readonly) NSString *oauth_token;
@property (nonatomic, copy, readonly) NSString *os_versions;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pagesize;
@property (nonatomic, assign) CGFloat screensize;
@property (nonatomic, copy, readonly) NSString *track_device_info;
@property (nonatomic, copy, readonly) NSString *track_deviceid;
@property (nonatomic, copy, readonly) NSString *track_user_id;

+ (instancetype)params;
@end
