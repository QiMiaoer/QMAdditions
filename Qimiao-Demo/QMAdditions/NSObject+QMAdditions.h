//
//  NSObject+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GetScreenScale [UIView getScreenScale]

@interface NSObject (QMAdditions)

/// 屏幕分辨率
+ (CGFloat)getScreenScale;

/// 转换成字符串
+ (NSString *)qm_transitionToJsonWithObject:(id)object;

/// 从plist文件加载资源
+ (NSDictionary *)qm_getResourcesWithPlistFileByFileName:(NSString *)fileName;

/// 从json文件加载资源
+ (id)qm_getResourcesWithjsonFileByFileName:(NSString *)fileName;

/// documentPath
+ (NSString *)qm_getDocumentPath;

/// 获取类的属性
+ (NSArray *)qm_getClassProperty;

@end
