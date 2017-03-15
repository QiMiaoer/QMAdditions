//
//  NSDate+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

- (NSString *)stringFromDateWithFormatString:(NSString *)formatString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatString;
    return [formatter stringFromDate:self];
}

+ (NSInteger)passDaysFromStartDate:(NSDate *)startDate toEndDate:(NSDate *)endDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:2];
    //去掉时分秒信息
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:startDate];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    return dayComponents.day;
}

+ (BOOL)compareBeforeCurrentDateWithTimeString:(NSString *)timeString {
    NSDate *currentTime = [timeString dataFromStringWithFormatString:DateFormat];
    NSDate *now = [[[NSDate date] stringFromDateWithFormatString:DateFormat] dataFromStringWithFormatString:DateFormat];
    if ([now compare:currentTime]==NSOrderedDescending)
    {
        return YES;
    }
    return NO;
}

- (NSString *)howLongTimeSinceCreateTime {
    NSDate *now = [NSDate date];
    NSTimeInterval howLong = [now timeIntervalSinceDate:self];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:howLong];//1970-1-1 0:0:0
    NSString *dateStr = [date description];
    const char *dateStrPtr = [dateStr UTF8String];
    int year, month, day, hour, minute, sec = 0;
    sscanf(dateStrPtr, "%d-%d-%d %d:%d:%d", &year, &month, &day, &hour, &minute, &sec);
    year -= 1970;
    month -= 1;
    day -= 1;
    if (year > 0) {//返回 year 年前
        return [NSString stringWithFormat:@"%d year ago",year];
    }else if (month > 0){//返回 month 月前
        return [NSString stringWithFormat:@"%d month ago",month];
    }else if (day > 0) {//返回 day 日前
        return [NSString stringWithFormat:@"%d day ago",day];
    }else if (hour > 0) {//返回 hour 小时前
        return [NSString stringWithFormat:@"%d hour ago",hour];
    }else if (minute > 0) {//返回 min 分钟前
        return [NSString stringWithFormat:@"%d minute ago",minute];
    }else{ //返回 sec 秒前
        return [NSString stringWithFormat:@"%d second ago",sec];
    }
}

- (NSString *)dateDescriptionWithWeekday {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *componets = [calendar components:unitFlags fromDate:self];
    switch (componets.weekday) {
        case 1 : {
            return @"星期日";
        };
            break;
        case 2 : {
            return @"星期一";
        };
            break;
        case 3 : {
            return @"星期二";
        };
            break;
        case 4 : {
            return @"星期三";
        };
            break;
        case 5 : {
            return @"星期四";
        };
            break;
        case 6 : {
            return @"星期五";
        };
            break;
        case 7 : {
            return @"星期六";
        };
            break;
            
        default:
            return @"";
            break;
    }
}

@end
