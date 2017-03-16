//
//  UIImage+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "UIImage+QMAdditions.h"

@implementation UIImage (QMAdditions)

+ (UIImage *)qm_imageWithRect:(CGRect)rect imageColor:(UIColor *)imageColor fillColor:(UIColor *)fillColor clipCircle:(BOOL)cilpCircle {
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    [fillColor setFill];
    UIRectFill(rect);
    UIBezierPath *path = cilpCircle ? path = [UIBezierPath bezierPathWithOvalInRect:rect] : [UIBezierPath bezierPathWithRect:rect];
    [imageColor setFill];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)qm_snapshotCurrentView:(UIView *)currentView {
    UIGraphicsBeginImageContext(currentView.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [currentView.layer renderInContext:ctx];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)qm_cilpIconWithRect:(CGRect)rect fillColor:(UIColor *)fillColor boardColor:(UIColor *)boardColor boardWidth:(CGFloat)boardWidth {
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    [fillColor setFill];
    UIRectFill(rect);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path addClip];
    [self drawInRect:rect];
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    ovalPath.lineWidth = boardWidth;
    [boardColor setStroke];
    [ovalPath stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)qm_zoomImageWithRect:(CGRect)rect {
    if (!self) { return nil; }
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
