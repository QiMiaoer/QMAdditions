//
//  UIColor+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QMAdditions)

/// 参数:red-green-blue-alpha
+ (UIColor *)qm_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/// 参数:red-green-blue
+ (UIColor *)qm_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/// 参数:hex-alpha
+ (UIColor *)qm_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

/// 参数:hex
+ (UIColor *)qm_colorWithHex:(uint32_t)hex;

/// 随机色
+ (UIColor *)qm_randowColor;

@end
