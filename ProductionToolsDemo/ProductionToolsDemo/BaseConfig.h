//
//  BaseConfig.h
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/19.
//  Copyright © 2018 龙禧. All rights reserved.
//

#ifndef BaseConfig_h
#define BaseConfig_h



#define IS_IPHONE_X ((Size_height == 812.0f || Size_height == 896.0f) ? YES : NO)
#define TableViewFrameY ((IS_IPHONE_X) ? 88.0f : 64.0f)
#define TableViewFrameBottom ((IS_IPHONE_X) ? 83.0f : 49.0f)


// 宏定义当前屏幕的宽度
#define Size_width [UIScreen mainScreen].bounds.size.width

// 宏定义当前屏幕的高度
#define Size_height [UIScreen mainScreen].bounds.size.height

#define KEYWINDOW [UIApplication sharedApplication].delegate.window

#define KAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])


#define F(string, args...)                  [NSString stringWithFormat:string, args]


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

#define StatusbarSize ((IS_IPHONE_X) ? 44.0f : 20.0f)


#endif /* BaseConfig_h */
