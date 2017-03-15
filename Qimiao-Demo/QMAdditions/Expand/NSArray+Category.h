//
//  NSArray+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

// 得到 mainStr 中符合条件的字串 条件 leftStr rightStr之间的字串
+ (NSArray *)getRangeStringWithLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr WithMainStr:(NSString *)mainStr;

@end
