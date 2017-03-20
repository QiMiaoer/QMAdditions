//
//  NSObject+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "NSObject+QMAdditions.h"
#import "QMCommonDefine.h"
#import <objc/runtime.h>

@implementation NSObject (QMAdditions)

+ (CGFloat)getScreenScale {
    CGFloat _screenScale = 0;
    if (_screenScale == 0) {
        if (iPhone6) {
            _screenScale = 0.5;
        } else if (iPhone4) {
            _screenScale = 0.5 * 480 / 667;
        } else if (iPhone5) {
            _screenScale = 0.5 * 568 / 667;
        } else if (iPhone6Plus) {
            _screenScale = 0.5 * 736 / 667;
        } else if (iPad){
            _screenScale = 0.35;//简单处理
        }else {
            _screenScale = 0.5;
        }
    }
    return _screenScale;
}

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
