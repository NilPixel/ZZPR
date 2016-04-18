//
//  ZZHomePageManager.m
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZHomePageManager.h"
#import <RXApiServiceEngine.h>
#import "ZZBaseRequestParams.h"
#import "ZZSubjectListPostParams.h"
#import "ZZHomeTopic.h"
#import "ZZListPost.h"
#import "ZZTopicNewInfo.h"
#import "ZZSubscribeTag.h"
@implementation ZZHomePageManager
+ (void)getBannerArrayWithCompeletionHandler:(CompeletionHandler)handler
{
    NSString *url = [kBaseURL stringByAppendingString:@"recommend/index?"];
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"page"]=@(0);
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (handler) {
                ZZHomePageData *data = [ZZHomePageData mj_objectWithKeyValues:jsonData[@"data"]];
                handler(data.banner,nil);
            }
        }
        else
        {
            if (error) {
                if (handler) {
                    handler(nil,error);
                }
            }
        }
        NSLog(@"%@",jsonData);
    }];
    
}
/**
 *  根据page获取首页数据
 *
 *  @param array 轮播图数组
 */
+ (void)getHomePageDataWithPage:(NSInteger)page
                 successHandler:(void (^)(ZZHomePageData *))successHandler
                 failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"page"] = @(page);
    NSString *url = [kBaseURL stringByAppendingString:@"recommend/index"];
    [RXApiServiceEngine requestWithType:RequestMethodTypeGet url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                ZZHomePageData *data= [ZZHomePageData mj_objectWithKeyValues:jsonData[@"data"]];
                successHandler(data);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  根据page返回话题list
 *
 *  @param page           页数
 *  @param extend         拼接的id字符串
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getTopicListWith:(NSInteger)page
                  extend:(NSString *)extend
          successHandler:(void (^)(NSArray *))successHandler
          failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"page"] = @(page);
    params[@"ids"] = extend;
    NSString *url = [kBaseURL stringByAppendingString:@"topic/list?"];
    [RXApiServiceEngine requestWithType:RequestMethodTypeGet url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                NSArray *data = [ZZHomeTopic mj_objectArrayWithKeyValuesArray:jsonData[@"data"]];
                successHandler(data);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  根据subjectId返回subJect
 *
 *  @param subjectId      subjectID
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getSubjectWithSubjectId:(NSInteger)subjectId successHandler:(void (^)(ZZCommunitySubject *))successHandler failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"subject_id"] = @(subjectId);
    NSString *url = [kBaseURL stringByAppendingString:@"community/subject/info"];
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                ZZCommunitySubject *subject = [ZZCommunitySubject mj_objectWithKeyValues:jsonData[@"data"][@"subject"]];
                successHandler(subject);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  根据page返回话题listPost
 *
 *  @param page           页数
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getListPostWithListPostParams:(ZZSubjectListPostParams *)listPostParams
                       successHandler:(void (^)(NSArray *))successHandler
                       failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = listPostParams.mj_keyValues;
    NSString *url = [kBaseURL stringByAppendingString:@"community/subject/listPost"];
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                NSArray *listPostArray = [ZZListPost mj_objectArrayWithKeyValuesArray:jsonData[@"data"]];
                successHandler(listPostArray);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
    
}
/**
 *  根据infoId返回listPostInfo
 *
 *  @param infoId         infoId
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getListPostInfoWithId:(NSString *)infoId successHandler:(void (^)(ZZListPost *))successhandler failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"id"] = infoId;
    NSString *url = [kBaseURL stringByAppendingString:@"community/post/info"];
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successhandler) {
                ZZListPost *listPost = [ZZListPost mj_objectWithKeyValues:jsonData[@"data"][@"post"]];
                successhandler(listPost);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  获取清单分类列表
 *
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getCategoryListSuccessHandler:(void (^)(NSArray *))successHandler failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    [params removeObjectForKey:@"pagesize"];
    [params removeObjectForKey:@"screensize"];
    NSString *url = [kBaseURL stringByAppendingString:@"category/list"];
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                successHandler([ZZSubscribeTag mj_objectArrayWithKeyValuesArray:jsonData[@"data"]]);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  获取热门标签列表
 *
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getHotTagListSuccessHandler:(void (^)(NSArray *))successHandler failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    [params removeObjectForKey:@"pagesize"];
    [params removeObjectForKey:@"screensize"];
    NSString *url = [kBaseURL stringByAppendingString:@"base/search/hottags"];
    [RXApiServiceEngine requestWithType:RequestMethodTypePost url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                successHandler(jsonData[@"data"]);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
/**
 *  获取topic详情
 *
 *  @param infoId id
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getTopicNewInfoWithId:(NSString *)infoId successHandler:(void (^)(ZZTopicNewInfo *))successHandler failureHandler:(FailureHandler)failureHandler
{
    NSMutableDictionary *params = [ZZBaseRequestParams params].mj_keyValues;
    params[@"id"] = infoId;
    params[@"statistics_uv"] = @0;
    [params removeObjectForKey:@"pagesize"];
    NSString *url = [kBaseURL stringByAppendingString:@"topic/newInfo?"];
    [RXApiServiceEngine requestWithType:RequestMethodTypeGet url:url parameters:params completionHanlder:^(id jsonData, NSError *error) {
        if (jsonData) {
            if (successHandler) {
                successHandler([ZZTopicNewInfo mj_objectWithKeyValues:jsonData[@"data"]]);
            }
        }
        else
        {
            if (error) {
                if (failureHandler) {
                    failureHandler(error);
                }
            }
        }
    }];
}
@end
