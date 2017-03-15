//
//  NSUserDefaults+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/10.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Category)

// 根据key存对象
+ (void)setObject:(id)object forKey:(NSString *)key;

// 根据key取对象
+ (id)objectForKey:(NSString *)key;

// 根据key存布尔值
+ (void)setBool:(BOOL)boo forKey:(NSString *)key;

// 根据key取布尔值
+ (BOOL)boolForKey:(NSString *)key;

// 根据key移除对象
+ (void)removeObjectForKey:(NSString *)key;

@end
