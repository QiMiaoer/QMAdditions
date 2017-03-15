//
//  NSDictionary+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

// 字典是否存在这个key
- (BOOL)ContainsKey:(NSString *)key;

// 根据文件名获得dic资源   type "plist"
+ (NSDictionary *)getResourcesTypeOfPlistWithFileName:(NSString *)fileName;

// 根据文件名获得dic资源   type "json"
+ (NSDictionary *)getResourcesTypeOfJsonWithFileName:(NSString *)fileName;

@end
