//
//  ZZPlusButton.m
//  HalfSugarism
//
//  Created by Mime97 on 16/3/28.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#import "ZZPlusButton.h"
#import "ZZTabBarController.h"

UIButton<ZZPlusButtonSubClassing> *ZZExternPushlishButton = nil;
@interface ZZPlusButton ()<UIActionSheetDelegate>

@end
@implementation ZZPlusButton

+ (void)registerSubClass
{
    if ([self conformsToProtocol:@protocol(ZZPlusButtonSubClassing)]) {
        Class<ZZPlusButtonSubClassing> class = self;
        ZZExternPushlishButton = [class plusButton];
    }
}

@end
