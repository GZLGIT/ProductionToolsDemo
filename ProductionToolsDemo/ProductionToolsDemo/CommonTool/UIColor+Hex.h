//
//  UIColor+Hex.h
//  CarSharing
//
//  Created by 郭子立 on 2017/6/13.
//  Copyright © 2017年 CarSharing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

// 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithHex:(long)hexColor;
// 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *)colorWithHexString:(NSString *)color;
// 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
