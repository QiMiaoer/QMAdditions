//
//  UIImage+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

// 根据颜色、大小生成纯色图片
+ (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)frame;

// 生成指定大小和颜色的圆形图
+ (UIImage *)circularImageWithFrame:(CGRect)frame color:(UIColor *)color;

// 缩放图片到指定frame
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)size;

// 改变图片颜色到指定颜色
- (UIImage *)changeImageColor:(UIColor *)color;

// 图片模糊处理
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;

@end
