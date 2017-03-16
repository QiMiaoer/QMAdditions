//
//  UIButton+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UIButton+QMAdditions.h"

@implementation UIButton (QMAdditions)

+ (UIButton *)qm_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor titleSelectedColor:(UIColor *)titleSelectedColor titleHighlightedColor:(UIColor *)titleHighlightedColor backgroundColor:(UIColor *)backgroundColor normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage {
    UIButton *button = [UIButton new];
    button.frame = frame;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [button setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    [button setTitleColor:titleHighlightedColor forState:UIControlStateHighlighted];
    [button setBackgroundColor:backgroundColor];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button sizeToFit];
    return button;
}

+ (UIButton *)qm_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor titleSelectedColor:(UIColor *)titleSelectedColor titleHighlightedColor:(UIColor *)titleHighlightedColor backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage {
    return [UIButton qm_buttonWithFrame:frame title:title font:font titleNormalColor:titleNormalColor titleSelectedColor:titleSelectedColor titleHighlightedColor:titleHighlightedColor backgroundColor:backgroundColor normalImage:nil selectedImage:nil highlightedImage:nil backgroundImage:backgroundImage];
}

+ (UIButton *)qm_buttonWithFrame:(CGRect)frame normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highlightedImage:(UIImage *)highlightedImage {
    return [UIButton qm_buttonWithFrame:frame title:nil font:nil titleNormalColor:nil titleSelectedColor:nil titleHighlightedColor:nil backgroundColor:nil normalImage:normalImage selectedImage:selectedImage highlightedImage:highlightedImage backgroundImage:nil];
}

@end
