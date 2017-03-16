//
//  NSString+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QMAdditions)

/// MD5加密
- (NSString *)qm_MD5;

/// 判断QQ号
- (BOOL)qm_validQQNumber;

/// 判断微信号
- (BOOL)qm_validWechatNumber;

/// 判断银行卡号
- (BOOL)qm_validBankCardNumber;

/// 判断身份证号
- (BOOL)qm_validIdentityCardNumber;

/// 判断邮箱
- (BOOL)qm_validEmail;

/// 判断手机号
- (BOOL)qm_validMobiePhoneNumber;

/// 判断车牌号
- (BOOL)qm_validCarNumber;

/// 判断邮政编码
- (BOOL)qm_validPostCardNumber;

@end
