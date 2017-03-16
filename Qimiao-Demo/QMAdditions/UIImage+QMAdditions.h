//
//  UIImage+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QMAdditions)

/// 参数:frame-color
+ (UIImage *)qm_imageWithRect:(CGRect)rect imageColor:(UIColor *)imageColor fillColor:(UIColor *)fillColor clipCircle:(BOOL)cilpCircle;

/// 当前视图截图
+ (UIImage *)qm_snapshotCurrentView:(UIView *)currentView;

/// 头像圆角化
- (UIImage *)qm_cilpIconWithRect:(CGRect)rect fillColor:(UIColor *)fillColor boardColor:(UIColor *)boardColor boardWidth:(CGFloat)boardWidth;

/// 参数:size
- (UIImage *)qm_zoomImageWithRect:(CGRect)rect;

@end
