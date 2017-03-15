//
//  NSArray+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

+ (NSArray *)getRangeStringWithLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr WithMainStr:(NSString *)mainStr {
    NSString *left = leftStr;
    NSString *right = rightStr;
    NSString *resultStr;
    NSMutableArray *arr = [NSMutableArray array];
    NSScanner *scanner = [NSScanner scannerWithString:mainStr];
    while ([scanner isAtEnd] == NO) {
        [scanner scanUpToString:left intoString:NULL];
        [scanner scanUpToString:right intoString:&resultStr];
        resultStr = [resultStr stringByReplacingOccurrencesOfString:left withString:@""];
        if (resultStr.length != 0) {
            [arr addObject:resultStr];
        }
    }
    if (arr.count != 0) {
        [arr removeLastObject];
    }
    return arr;
}

@end
