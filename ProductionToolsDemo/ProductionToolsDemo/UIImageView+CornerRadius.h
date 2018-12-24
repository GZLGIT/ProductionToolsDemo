//
//  UIImageView+CornerRadius.h
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/22.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (CornerRadius)


- (UIImage *)imageWithRoundCorner:(UIImage*)sourceImage cornerRadius:(CGFloat)cornerRadius size:(CGSize)size; 

@end

NS_ASSUME_NONNULL_END
