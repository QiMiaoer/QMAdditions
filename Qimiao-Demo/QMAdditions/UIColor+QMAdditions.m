//
//  UIColor+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UIColor+QMAdditions.h"

@implementation UIColor (QMAdditions)

+ (UIColor *)qm_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/225.0 green:green/225.0 blue:blue/225.0 alpha:alpha];
}

+ (UIColor *)qm_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor qm_colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)qm_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {
    return [UIColor qm_colorWithRed:(hex & 0xff0000) >> 16 green:(hex & 0x00ff00) >> 8 blue:hex & 0x0000ff alpha:alpha];
}

+ (UIColor *)qm_colorWithHex:(uint32_t)hex {
    return [UIColor qm_colorWithHex:hex alpha:1.0];
}

+ (UIColor *)qm_randowColor {
    return [UIColor  qm_colorWithRed:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}

@end
