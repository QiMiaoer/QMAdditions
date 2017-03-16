//
//  UILabel+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UILabel+QMAdditions.h"

@implementation UILabel (QMAdditions)

+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backgroundColor;
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    [label sizeToFit];
    return label;
}

+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {
    return [UILabel qm_labelWithFrame:frame text:text font:font textColor:textColor backgroundColor:backgroundColor textAlignment:0];
}

+ (UILabel *)qm_labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    return [UILabel qm_labelWithFrame:frame text:text font:font textColor:textColor backgroundColor:nil];
}

@end
