//
//  UIViewController+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional

// Override this method in UIViewController derived class to handle 'Back' button click
- (BOOL)navigationBackButtonClicked;

@end

@interface UIViewController (Category)<BackButtonHandlerProtocol>

// 获得当前控制器
+ (UIViewController *)CurrentViewController;

// 获得当前控制器视图
+ (UIViewController *)CurrentViewControllerView;

@end
