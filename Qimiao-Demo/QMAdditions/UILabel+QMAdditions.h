//
//  UILabel+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QMAdditions)

/// 参数:frame-title-font-textColor-backgroundColor-textAlignment
+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment;

/// 参数:frame-title-font-textColor-backgroundColor
+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;

/// 参数:frame-title-font-textColor
+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end
