//
//  NSObject+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "NSObject+QMAdditions.h"
#import <objc/runtime.h>

@implementation NSObject (QMAdditions)

+ (NSString *)qm_transitionToJsonWithObject:(id)object {
    NSString *json = @"";
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return json;
}

+ (NSDictionary *)qm_getResourcesWithPlistFileByFileName:(NSString *)fileName {
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
}

+ (id)qm_getResourcesWithjsonFileByFileName:(NSString *)fileName {
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"json"] options:0 error:nil] options:NSJSONReadingMutableLeaves error:nil];
}

+ (NSString *)qm_getDocumentPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSArray *)qm_getClassProperty {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList(self, &outCount);
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < outCount; ++i) {
        Ivar ivar = *(ivars + i);
        [arr addObject:[NSString stringWithFormat:@"%s", ivar_getName(ivar)]];
    }
    free(ivars);    
    return arr;
}

@end
