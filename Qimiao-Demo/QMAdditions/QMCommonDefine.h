//
//  QMCommonDefine.h
//  Qimiao-Demo
//
//  Created by zyx on 17/3/20.
//  Copyright © 2017年 其妙. All rights reserved.
//

#ifndef QMCommonDefine_h
#define QMCommonDefine_h

#ifdef DEBUG
#define DLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define DLog(...)
#endif

#define StatusBarHeight 20
#define NavigationBarHeight 44
#define StatusBarNavigationBarHeight StatusBarHeight+NavigationBarHeight
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenSize [UIScreen mainScreen].bounds.size

#define PushToVC(vc) [self.navigationController pushViewController:(vc) animated:YES]
#define WeakPushVC(vc) [weak.navigationController pushViewController:(vc) animated:YES]

#define ImageNamed(imageName) [UIImage imageNamed:imageName]

#define RGB(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB16A(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// 使用这里的转换方法的前提是：基于iPhone6设计和进行标注，photoshop的PPI为72，标注单位为px
#define GetOKSizeByUISize(size) GetScreenScale*size
#define SystemFont(font) [UIFont systemFontOfSize:GetScreenScale*font]
#define BoldSystemFont(font) [UIFont boldSystemFontOfSize:GetScreenScale*font]

#define HideKeyboard [[[UIApplication sharedApplication] keyWindow] endEditing:YES]

#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#define GCDAsyncGlobalBlock(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define GCDAsyncMainBlock(block) dispatch_async(dispatch_get_main_queue(),block)

#define DegreesToRadian(x) (M_PI * (x) / 180.0)
#define RadianToDegrees(radian) (radian * 180.0) / (M_PI)

#define WeakSelf __weak __typeof(&*self)weak = self

#define kLocalizedString(x, ...) NSLocalizedString(x, nil)

#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#define CurrentSystemVersion   floorf([[UIDevice currentDevice].systemVersion floatValue])

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iPhone4 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )480) < DBL_EPSILON )
#define iPhone5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define iPhone6 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )667) < DBL_EPSILON )
#define iPhone6Plus (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )960) < DBL_EPSILON)

// 声明、实现单例
#define Singleton_interface(classname)\
+ (classname *)shared##classname;\
\

#define Singleton_implementation(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\

#endif /* QMCommonDefine_h */
