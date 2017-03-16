//
//  NSUserDefaults+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "NSUserDefaults+QMAdditions.h"

@implementation NSUserDefaults (QMAdditions)

+ (void)qm_setObject:(id)object forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)qm_objectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)qm_setBool:(BOOL)boo forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setBool:boo forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)qm_boolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (void)qm_removeObjectForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

@end
