//
//  Constant.h
//  HalfSugarism
//
//  Created by zhaozheng on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

// 调试输出日志
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif



#endif /* Constant_h */