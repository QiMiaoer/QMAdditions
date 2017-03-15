//
//  NSString+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Category)

// email 是否有效
- (BOOL)isValidEmail;

// 验证电话号码(正则为@"[0-9]{1,20}")
- (BOOL)isValidTelNumber;

// 自适应size
- (CGSize )getContentSizeWithFont:(UIFont *)font hopeSize:(CGSize )hopeSize;

// 字符串转日期
- (NSDate *)dataFromStringWithFormatString:(NSString *)formatString;

// 设置字符串中特殊字符keyWord的大小、颜色
- (NSMutableAttributedString *)attributedStringWithKeyWord:(NSString *)keyWord font:(UIFont *)font color:(UIColor *)color;

// 设置字符串中特殊字符串数组keyWords的大小、颜色
- (NSMutableAttributedString *)attributedStringWithKeyWords:(NSArray *)keyWords font:(UIFont *)font color:(UIColor *)color;

// 字符串中是否包含字段searchChar
- (BOOL)isContaintCaseIn:(NSString *)searchChar;

// Json转字符串
+ (NSString *)stringWithJson:(id)jsonObj;

// 获得设备UUID
+ (NSString *)getUUID;

@end
