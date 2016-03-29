//
//  UIConstant.h
//  HalfSugarism
//
//  Created by Mime97 on 16/3/29.
//  Copyright © 2016年 zhaozheng. All rights reserved.
//

#ifndef UIConstant_h
#define UIConstant_h

//rgb颜色转换 （16进制->10进制）
#define mRGBToColor(rgb)  [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0];



#endif /* UIConstant_h */
