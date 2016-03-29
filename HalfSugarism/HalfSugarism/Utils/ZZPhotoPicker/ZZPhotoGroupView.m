//
//  ZZPhotoGroupView.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPhotoGroupView.h"
#import "ZZPhotoGroupCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "ZZPhotoGroupViewController.h"
@interface ZZPhotoGroupView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) ALAssetsLibrary * assetsLibrary;
@property (nonatomic, strong) NSMutableArray * group;

@end
@implementation ZZPhotoGroupView

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder] ) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)initCommon
{
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[ZZPhotoGroupCell class] forCellReuseIdentifier:@"ZZPhotoGroupCell"];
    self.backgroundColor = mRGBToColor(0xebebeb);
}

//加载相册

- (void)setUpGroup
{
    [self.group removeAllObjects];
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup * group,BOOL *stop)
    {
        if (group) {
            [group setAssetsFilter:self.assetsFilter];
            if (group.numberOfAssets > 0 ||((ZZPhotoGroupViewController*)_my_deleagte).showEmptyGroups){
                if ([[group valueForProperty:ALAssetsGroupPropertyType] intValue] == ALAssetsGroupSavedPhotos) {
                    [self.group insertObject:group atIndex:0];
                }
                else if ([[group valueForProperty:ALAssetsGroupPropertyType] intValue] == ALAssetsGroupPhotoStream && self.group.count > 0)
                {
                    [self.group insertObject:group atIndex:1];
                }
                else
                {
                    [self.group addObject:group];
                }
            }

        }
        else
        {
            [self dataReload];
        }
        
    };
    
    ALAssetsLibraryAccessFailureBlock  failureBlock = ^(NSError * error)
    {
        //没有权限
        [self showNotAllowed];
    };
    
    //显示的相册
    NSUInteger type = ALAssetsGroupSavedPhotos | 
    
}
#pragma mark - DataReload
- (void)dataReload
{
    
}
#pragma mark - Not Allowed
- (void)showNotAllowed
{
    
}
@end
