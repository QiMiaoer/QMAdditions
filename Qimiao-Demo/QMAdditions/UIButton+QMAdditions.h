//
//  UIButton+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QMAdditions)

/// 参数:frame-title-font-titleNormalColor-titleSelectedColor-titleHighlightedColor-backgroundColor-normalImage-selectedImage-highlightedImage-backgroundImage
+ (UIButton *)qm_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor  titleSelectedColor:(UIColor *)titleSelectedColor titleHighlightedColor:(UIColor *)titleHighlightedColor backgroundColor:(UIColor *)backgroundColor normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highlightedImage:(UIImage *)highlightedImage backgroundImage:(UIImage *)backgroundImage;

/// 参数:frame-title-font-titleNormalColor-titleSelectedColor-titleHighlightedColor-backgroundColor-backgroundImage
+ (UIButton *)qm_buttonWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor titleSelectedColor:(UIColor *)titleSelectedColor titleHighlightedColor:(UIColor *)titleHighlightedColor backgroundColor:(UIColor *)backgroundColor backgroundImage:(UIImage *)backgroundImage;

/// 参数:frame-normalImage-selectedImage-highlightedImage
+ (UIButton *)qm_buttonWithFrame:(CGRect)frame normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage highlightedImage:(UIImage *)highlightedImage;

@end
