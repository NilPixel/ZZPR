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
    NSUInteger type = ALAssetsGroupSavedPhotos | ALAssetsGroupPhotoStream | ALAssetsGroupLibrary | ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces ;
    
    [self.assetsLibrary enumerateGroupsWithTypes:type
                                      usingBlock:resultBlock
                                    failureBlock:failureBlock];
    
}
#pragma mark - DataReload
- (void)dataReload
{
    //没有图片
    if (self.group.count == 0) {
        [self showNoAsset];
    }
    if (self.group.count >0 &&[_my_deleagte respondsToSelector:@selector(didSelectGroup:)]) {
        [_my_deleagte didSelectGroup:self.group[0]];
    }
    [self reloadData];
}
#pragma mark - Not Allowed
- (void)showNotAllowed
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"NotAllowedPhoto" object:nil];
    if ([_my_deleagte respondsToSelector:@selector(didSelectGroup:)]) {
        [_my_deleagte didSelectGroup:nil];
    }
    
}

- (void)showNoAsset
{
    NSLog(@"%s",__func__);
}

#pragma mark - UITableViewDelegate

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifer = @"ZZPhotoGroupCell";
    ZZPhotoGroupCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[ZZPhotoGroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    [cell bind:self.group[indexPath.row]];
    if (indexPath.row == self.selectIndex) {
        cell.backgroundColor = mRGBToColor(0xd9d9d9);
    }
    return cell;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.group.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectIndex = indexPath.row;
    [self reloadData];
    ALAssetsGroup * groups = self.group[indexPath.row];
    if ([_my_deleagte respondsToSelector:@selector(didSelectGroup:)]) {
        [_my_deleagte didSelectGroup:groups];
    }
}
#pragma mark - getter/setter
- (NSMutableArray *)group
{
    if (!_group) {
        _group = [[NSMutableArray alloc]init];
    }
    return _group;
}

#pragma mark - ALAssetsLibrary

- (ALAssetsLibrary *)assetsLibrary
{
    if (!_assetsLibrary) {
        static dispatch_once_t pred = 0;
        static ALAssetsLibrary * library = nil;
        dispatch_once(&pred, ^{
            library = [[ALAssetsLibrary alloc]init];
        });
        _assetsLibrary = library;
    }
    return _assetsLibrary;
}
@end
