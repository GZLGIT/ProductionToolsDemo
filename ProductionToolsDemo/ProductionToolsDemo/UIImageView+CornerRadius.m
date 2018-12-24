//
//  UIImageView+CornerRadius.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/22.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "UIImageView+CornerRadius.h"

@implementation UIImageView (CornerRadius)

- (UIImage *)imageWithRoundCorner:(UIImage*)sourceImage cornerRadius:(CGFloat)cornerRadius size:(CGSize)size {
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:cornerRadius];
    [path addClip];
    [sourceImage drawInRect:bounds];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
