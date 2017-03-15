//
//  NSDictionary+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (BOOL)ContainsKey:(NSString *)key {
    if (self) {
        return [self valueForKey:key] != nil && ![[self valueForKey:key] isEqual:[NSNull null]];
    }
    return NO;
}

+ (NSDictionary *)getResourcesTypeOfPlistWithFileName:(NSString *)fileName {
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
}

+ (NSDictionary *)getResourcesTypeOfJsonWithFileName:(NSString *)fileName {
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"json"] options:0 error:nil] options:NSJSONReadingMutableLeaves error:nil];
}

@end
