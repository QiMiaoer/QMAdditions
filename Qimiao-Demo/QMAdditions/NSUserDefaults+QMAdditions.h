//
//  NSUserDefaults+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (QMAdditions)

// 根据key存对象
+ (void)qm_setObject:(id)object forKey:(NSString *)key;

// 根据key取对象
+ (id)qm_objectForKey:(NSString *)key;

// 根据key存布尔值
+ (void)qm_setBool:(BOOL)boo forKey:(NSString *)key;

// 根据key取布尔值
+ (BOOL)qm_boolForKey:(NSString *)key;

// 根据key移除对象
+ (void)qm_removeObjectForKey:(NSString *)key;

@end
