//
//  ZZPlusButtonSubClass.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPlusButtonSubClass.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "ZZTabBarController.h"
#import "ZZNavigationController.h"
#import "BoPhotoPickerViewController.h"
@interface ZZPlusButtonSubClass () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,BoPhotoPickerProtocol>
{
    CGFloat _buttonImageHeight;
}
@end

@implementation ZZPlusButtonSubClass
#pragma mark -
#pragma mark - Life Cycle

+ (void)load
{
    [super registerSubclass];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark -
#pragma mark - Public Methods
+ (instancetype)plusButton
{
    UIImage * buttonImage = [UIImage imageNamed:@"tab_publish_add"];

    UIImage * heightLightImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    UIImage * iconImage = [UIImage imageNamed:@"tab_publish_add"];
    UIImage * heightLightIconImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    ZZPlusButtonSubClass * button = [ZZPlusButtonSubClass buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setImage:heightLightIconImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:heightLightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark -
#pragma mark - Event Response

- (void)clickPublish {
    BoPhotoPickerViewController *picker = [[BoPhotoPickerViewController alloc] init];
    //    picker.maximumNumberOfSelection = 10;
    //    self.picker.multipleSelection = YES;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups = YES;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return YES;
    }];
    
    ZZTabBarController *rootVC = (ZZTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    ZZNavigationController *nav = rootVC.selectedViewController;
    ZZNavigationController *nav2 = [[ZZNavigationController alloc] initWithRootViewController:picker];
    [nav.viewControllers[0] presentViewController:nav2 animated:YES completion:nil];
}

#pragma mark - BoPhotoPickerProtocol
- (void)photoPickerDidCancel:(BoPhotoPickerViewController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)photoPicker:(BoPhotoPickerViewController *)picker didSelectAssets:(NSArray *)assets {
    if (assets.count==1 ) {
        //        ALAsset *asset=assets[0];
        //        UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)photoPicker:(BoPhotoPickerViewController *)picker didSelectAsset:(ALAsset *)asset {
    NSLog(@"%s",__func__);
}

- (void)photoPicker:(BoPhotoPickerViewController *)picker didDeselectAsset:(ALAsset *)asset {
    NSLog(@"%s",__func__);
}

//超过最大选择项时
- (void)photoPickerDidMaximum:(BoPhotoPickerViewController *)picker {
    NSLog(@"%s",__func__);
}

//低于最低选择项时
- (void)photoPickerDidMinimum:(BoPhotoPickerViewController *)picker {
    NSLog(@"%s",__func__);
}

- (void)photoPickerTapAction:(BoPhotoPickerViewController *)picker {
    //    if(![self checkCameraAvailability]){
    //        NSLog(@"没有访问相机权限");
    //        return;
    //    }
    [picker dismissViewControllerAnimated:NO completion:nil];
    UIImagePickerController *cameraUI = [UIImagePickerController new];
    cameraUI.allowsEditing = NO;
    cameraUI.delegate = self;
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.cameraFlashMode=UIImagePickerControllerCameraFlashModeAuto;
    
    ZZTabBarController *rootVC = (ZZTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    ZZNavigationController *nav = rootVC.selectedViewController;
    
    [nav presentViewController:cameraUI animated: YES completion:nil];
}

#pragma mark - UIImagePickerDelegate
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
    if (!error) {
        NSLog(@"保存到相册成功");
    }else{
        NSLog(@"保存到相册出错%@", error);
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage;
    if (CFStringCompare((CFStringRef) mediaType,kUTTypeImage, 0)== kCFCompareEqualTo) {
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    self.imageView.image = originalImage;
    
    ZZTabBarController *rootVC = (ZZTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    ZZNavigationController *nav = rootVC.selectedViewController;
    [nav dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


- (BOOL)checkCameraAvailability {
    BOOL status = NO;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized) {
        status = YES;
    } else if (authStatus == AVAuthorizationStatusDenied) {
        status = NO;
    } else if (authStatus == AVAuthorizationStatusRestricted) {
        status = NO;
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        status = NO;
    }
    return status;
}

@end
