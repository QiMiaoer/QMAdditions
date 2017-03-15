//
//  UIViewController+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

+ (UIViewController *)CurrentViewController {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = ((UITabBarController *)result).childViewControllers.firstObject;
    }
    if (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = ((UINavigationController *)result).childViewControllers.lastObject;
    }
    return result;
}

+ (UIView *)CurrentViewControllerView {
    UIViewController *vc = [UIViewController CurrentViewController];
    return vc.view;
}

@end

@implementation UINavigationController (ShouldPopOnBackButton)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    if(self.viewControllers.count < navigationBar.items.count) return YES;
    BOOL shouldPop = YES;
    UIViewController *vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationBackButtonClicked)]) {
        shouldPop = [vc navigationBackButtonClicked];
    }
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in navigationBar.subviews) {
            if(subview.alpha < 1.0) {
                [UIView animateWithDuration:0.25 animations:^{
                    subview.alpha = 1.0;
                }];
            }
        }
    }
    
    return NO;
}

@end
