//
//  UIImage+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

+ (UIImage *)createImageWithColor:(UIColor *)color frame:(CGRect)frame {
    CGRect rect = frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)circularImageWithFrame:(CGRect)frame color:(UIColor *)color {
    CGRect rect = frame;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat diameter = width - 2;
    CGFloat radius = diameter/2;
    CGPoint center = CGPointMake(width/2, height/2);
    UIColor *fillColor = color;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x-radius, center.y-radius, diameter, diameter)];
    [fillColor setFill];
    [maskPath fill];
    UIImage *_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _image;
}

+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)size {
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    } else {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

- (UIImage *)changeImageColor:(UIColor *)color {
    CGSize imageSize = self.size;
    CGSize itemImageSize = CGSizeMake(imageSize.width, imageSize.height);
    CGRect contextRect = CGRectMake(0, 0, itemImageSize.width, itemImageSize.height);
    CGPoint itemImagePosition;
    itemImagePosition.x = ceilf((contextRect.size.width - itemImageSize.width) / 2);
    itemImagePosition.y = ceilf((contextRect.size.height - itemImageSize.height) );
    UIGraphicsBeginImageContextWithOptions(itemImageSize, NO, 0.0);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginTransparencyLayer(c, NULL);
    CGContextScaleCTM(c, 1.0, -1.0);
    CGContextClipToMask(c, CGRectMake(itemImagePosition.x, -itemImagePosition.y, itemImageSize.width, -itemImageSize.height), [self CGImage]);
    contextRect.size.height = -contextRect.size.height;
    if (color) {
        [color set];
    }
    CGContextFillRect(c, contextRect);
    CGContextEndTransparencyLayer(c);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
