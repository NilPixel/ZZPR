//
//  ZZPhotoGroupViewController.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class ZZPhotoGroupViewController;
@protocol ZZPhotoGroupViewControllerProtocol <NSObject>

//选择完成
- (void)photoPicker:(ZZPhotoGroupViewController *)picker didSelectAssets:(NSArray *)assets;
- (void)photoPicker:(ZZPhotoGroupViewController *)picker didSelectAsset:(ALAsset *)asset;
- (void)photoPicker:(ZZPhotoGroupViewController *)picker didDeselectAsset:(ALAsset *)asset;
//相关操作
- (void)photoPickerTapAction:(ZZPhotoGroupViewController *)picker;
//取消
- (void)photoPickerDidCancel:(ZZPhotoGroupViewController *)picker;
//超过最大选择项时
- (void)photoPickerDidMaximum:(ZZPhotoGroupViewController *)picker;
//低于最低选择项时
- (void)photoPickerDidMinimum:(ZZPhotoGroupViewController *)picker;

@end
@interface ZZPhotoGroupViewController : UIViewController

@property (nonatomic, weak) id<ZZPhotoGroupViewControllerProtocol> delegate;
//选择过滤
@property (nonatomic, strong)NSPredicate *selectionFilter;
//资源(视频、照片)过滤
@property (nonatomic, strong)ALAssetsFilter *assetsFilter;
//选中的项
@property (nonatomic, strong)NSMutableArray * indexPathForSelectionItem;
//最多选择数量
@property (nonatomic, assign)NSInteger maximumNumberOfSelection;
//最少选择数量
@property (nonatomic, assign)NSInteger minimumNumberOfSelection;
//显示空相册
@property (nonatomic, assign)BOOL showEmptyGroups;
//是否开启多选
@property (nonatomic, assign)BOOL multipleSelection;

@end
