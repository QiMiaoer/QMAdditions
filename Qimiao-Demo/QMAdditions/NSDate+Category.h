//
//  NSDate+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

// 日期转字符串 formatString 如:@"yyyy-MM-dd HH:mm:ss.SSS"
- (NSString *)stringFromDateWithFormatString:(NSString *)formatString;

// 从日期startDate到endDate历时多少天
+ (NSInteger)passDaysFromStartDate:(NSDate *)startDate toEndDate:(NSDate *)endDate;

// timeString相对当前时间较早，return YES
+ (BOOL)compareBeforeCurrentDateWithTimeString:(NSString *)timeString;

// 从这个日期到现在过了多久   year ago      month ago     day ago    ... 
- (NSString *)howLongTimeSinceCreateTime;

// 根据日期获取 星期一~日
- (NSString *)dateDescriptionWithWeekday;

@end
