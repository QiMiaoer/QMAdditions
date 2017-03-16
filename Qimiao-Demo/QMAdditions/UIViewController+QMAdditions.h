//
//  UIViewController+QMAdditions.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/16.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClickBackButtonDelegate <NSObject>

@optional
- (BOOL)qm_navigationBackButtonClicked;

@end

@interface UIViewController (QMAdditions)<ClickBackButtonDelegate>

/// 获取当前显示的viewController
+ (UIViewController *)qm_getCurrentShowViewController;

@end
