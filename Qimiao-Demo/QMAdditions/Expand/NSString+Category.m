//
//  NSString+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/9.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (BOOL)isValidEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidTelNumber {
    NSString *strRegex = @"^((\\+86)|(86))?1[3|4|5|8]\\d{9}$";//@"^1[3|4|5|8]\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex];
    return [predicate evaluateWithObject:self];
}

- (CGSize )getContentSizeWithFont:(UIFont *)font hopeSize:(CGSize )hopeSize {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    NSDictionary *contentDic = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize  contentSize = [self boundingRectWithSize:hopeSize options:NSStringDrawingUsesLineFragmentOrigin attributes:contentDic context:nil].size;
    CGFloat width = ceil(contentSize.width);
    CGFloat height = ceil(contentSize.height);
    CGSize  size = CGSizeMake(width, height);
    return size;
}

- (NSDate *)dataFromStringWithFormatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

- (NSMutableAttributedString *)attributedStringWithKeyWord:(NSString *)keyWord font:(UIFont *)font color:(UIColor *)color {
    NSMutableAttributedString *resultAttString = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:keyWord];
    [resultAttString addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:range];
    return resultAttString;
}

- (NSMutableAttributedString *)attributedStringWithKeyWords:(NSArray *)keyWords font:(UIFont *)font color:(UIColor *)color {
    NSMutableAttributedString *resultAttString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < [keyWords count]; i++) {
        NSString *keyString = [keyWords objectAtIndex:i];
        NSRange range = [self rangeOfString:keyString];
        NSValue *value = [NSValue valueWithRange:range];
        if (range.length > 0) {
            [rangeArray addObject:value];
        }
    }
    for (NSValue *value in rangeArray) {
        NSRange keyRange = [value rangeValue];
        [resultAttString addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:keyRange];
    }
    return resultAttString;
}

- (BOOL)isContaintCaseIn:(NSString *)searchChar {
    NSRange foundObj=[self rangeOfString:searchChar options:NSCaseInsensitiveSearch];
    if(foundObj.location!=NSNotFound) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)stringWithJson:(id)jsonObj {
    NSString *jsonStr = @"";
    if ([NSJSONSerialization isValidJSONObject:jsonObj]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObj options:NSJSONWritingPrettyPrinted error:&error];
        jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonStr;
}

+ (NSString *)getUUID {
    NSString *uuid = nil;
    uuid = [NSString appleIFA];
    if (uuid.length == 0) {
        uuid = [NSString appleIFV];
    }
    if (uuid.length == 0) {
        uuid =  [NSString randomUUID];
    }
    return uuid ? uuid : @"NotFoundUUID!!!";
}

+ (NSString *)appleIFA {
    NSString *ifa = nil;
    Class ASIdentifierManagerClass = NSClassFromString(@"ASIdentifierManager");
    // a dynamic way of checking if AdSupport.framework is available
    if (ASIdentifierManagerClass) {
        SEL sharedManagerSelector = NSSelectorFromString(@"sharedManager");
        id sharedManager = ((id (*)(id, SEL))[ASIdentifierManagerClass methodForSelector:sharedManagerSelector])(ASIdentifierManagerClass, sharedManagerSelector);
        SEL advertisingIdentifierSelector = NSSelectorFromString(@"advertisingIdentifier");
        NSUUID *advertisingIdentifier = ((NSUUID* (*)(id, SEL))[sharedManager methodForSelector:advertisingIdentifierSelector])(sharedManager, advertisingIdentifierSelector);
        ifa = [advertisingIdentifier UUIDString];
    }
    return ifa;
}

+ (NSString *)appleIFV {
    if(NSClassFromString(@"UIDevice") && [UIDevice instancesRespondToSelector:@selector(identifierForVendor)]) {
        // only available in iOS >= 6.0
        return [[UIDevice currentDevice].identifierForVendor UUIDString];
    }
    return nil;
}
+ (NSString *)randomUUID {
    // only available in iOS >= 6.0
    if(NSClassFromString(@"NSUUID")) {
        return [[NSUUID UUID] UUIDString];
    }
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef cfuuid = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    NSString *uuid = [((__bridge NSString *) cfuuid) copy];
    CFRelease(cfuuid);
    return uuid;
}

@end
