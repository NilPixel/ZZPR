//
//  ZZHomePageManager.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/4/11.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZHomePageData.h"
#import "ZZCommunitySubject.h"
@class ZZSubjectListPostParams,ZZListPost,ZZTopicNewInfo;
typedef void(^CompeletionHandler) (NSArray *dataArray,NSError *error);
typedef void(^FailureHandler)(NSError *error);
@interface ZZHomePageManager : NSObject
/**
 *  获取轮播图数组
 *
 *  @param array 轮播图数组
 */
+ (void)getBannerArrayWithCompeletionHandler:(CompeletionHandler)handler;
/**
 *  根据page获取首页数据
 *
 *  @param array 轮播图数组
 */
+ (void)getHomePageDataWithPage:(NSInteger)page
                 successHandler:(void(^)(ZZHomePageData * pageData))successHandler
                 failureHandler:(FailureHandler)failureHandler;
/**
 *  根据page返回话题list
 *
 *  @param page           页数
 *  @param extend         拼接的id字符串
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getTopicListWith:(NSInteger)page extend:(NSString *)extend successHandler:(void(^)(NSArray *topicList))successHandler failureHandler:(FailureHandler)failureHandler;
/**
 *  根据subjectId返回subJect
 *
 *  @param subjectId      subjectID
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getSubjectWithSubjectId:(NSInteger)subjectId successHandler:(void(^)(ZZCommunitySubject *subject))successHandler failureHandler:(FailureHandler)failureHandler;
/**
 *  根据page返回话题listPost
 *
 *  @param page           页数
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getListPostWithListPostParams:(ZZSubjectListPostParams *)listPostParams successHandler:(void(^)(NSArray *listPostArray))successHandler failureHandler:(FailureHandler)failureHandler;

/**
 *  根据infoId返回listPostInfo
 *
 *  @param infoId         infoId
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getListPostInfoWithId:(NSString *)infoId successHandler:(void(^)(ZZListPost *listPost))successhandler failureHandler:(FailureHandler)failureHandler;
/**
 *  获取清单分类列表
 *
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getCategoryListSuccessHandler:(void(^)(NSArray *categoryArray))successHandler failureHandler:(FailureHandler)failureHandler;
/**
 *  获取热门标签列表
 *
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getHotTagListSuccessHandler:(void(^)(NSArray *tagsArray))successHandler failureHandler:(FailureHandler)failureHandler;
/**
 *  获取topic详情
 *
 *  @param infoId id
 *  @param successHandler 成功回调
 *  @param failuteHandler 失败回调
 */
+ (void)getTopicNewInfoWithId:(NSString *)infoId successHandler:(void(^)(ZZTopicNewInfo *newInfo))successHandler failureHandler:(FailureHandler)failureHandler;

@end
