//
//  NSString+QMAdditions.m
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "NSString+QMAdditions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (QMAdditions)

- (NSString *)qm_MD5 {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return [result lowercaseString];
}

- (CGFloat)fileSize {
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL exists = [manager fileExistsAtPath:self isDirectory:&isDir];
    if (!exists) {
        return 0;
    }
    if (isDir) {
        NSArray *subpaths = [manager subpathsAtPath:self];
        NSInteger totalByteSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            BOOL dir = NO;
            [manager fileExistsAtPath:fullSubpath isDirectory:&dir];
            if (!dir) {
                totalByteSize += [[manager attributesOfItemAtPath:fullSubpath error:nil] fileSize];
            }
        }
        return totalByteSize / 1024.0 / 1024.0;
    } else {
        return [[manager attributesOfItemAtPath:self error:nil] fileSize] / 1024.0 / 1024.0;
    }
}

- (BOOL)qm_validQQNumber {
    NSString *regex = @"[1-9][0-9]\{4,\\}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validWechatNumber {
    NSString *regex = @"^[a-zA-Z\\d_]{5,}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validBankCardNumber {
    NSString *regex = @"^(\\d{15,30})";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validIdentityCardNumber {
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validMobiePhoneNumber {
    NSString *regex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validCarNumber {
    NSString *regex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)qm_validPostCardNumber {
    NSString *regex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

@end
