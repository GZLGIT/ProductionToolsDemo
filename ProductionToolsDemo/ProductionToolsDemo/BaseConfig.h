//
//  BaseConfig.h
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/19.
//  Copyright © 2018 龙禧. All rights reserved.
//

#ifndef BaseConfig_h
#define BaseConfig_h



// 宏定义当前屏幕的宽度
#define Size_width [UIScreen mainScreen].bounds.size.width

// 宏定义当前屏幕的高度
#define Size_height [UIScreen mainScreen].bounds.size.height

#define KEYWINDOW [UIApplication sharedApplication].delegate.window

#define KAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])


#define F(string, args...)                  [NSString stringWithFormat:string, args]

// 判断 iPhone X xr,xsmax
#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height - 812.0) >= 0 ? YES : NO)

// 状态栏默认高度
#define kStatusBarHeight ((IS_IPHONEX) ? 44.0f : 20.0f)
// 导航栏默认高度
#define kNavigationBarHeight 44.0
// 状态栏加导航栏高度
#define kTopHeight (kStatusBarHeight + kNavigationBarHeight)
// 底部高度
#define kBottomHeight ((IS_IPHONEX) ? 34.0 : 0.0)

#define KTabBarBottomHeight ((IS_IPHONEX) ? 83.0f : 49.0f)

#define ScaleW(width)  [F(@"%f", width*Size_width/375.0f) integerValue]

#define ScaleH(height) [F(@"%f", height*Size_height/667.0f) integerValue]


#define ScaleFont(size) ([CheckOutTool setDifferenceScreenFontSizeWithFontOfSize:size])

// iPhoneX  iPhoneXS  iPhoneXS Max  iPhoneXR 机型判断
//#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? ((NSInteger)(([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] currentMode].size.width)*100) == 216) : NO)





//获取rgb颜色
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:(float)1.0]

//系统颜色
#define OrangeColorAPP \
[UIColor colorWithRed:250/255.f green:151/255.f blue:71/255.f alpha:1]

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])



#endif /* BaseConfig_h */
