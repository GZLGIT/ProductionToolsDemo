//
//  SaveData.h
//  CarSharing
//
//  Created by 王振雨 on 2016/12/15.
//  Copyright © 2016年 CarSharing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"
@interface SaveData : NSObject

// 本地存储个人信息
+ (void)saveAccount:(LoginModel *)account;
+ (void)deleteAccount;
+ (LoginModel *)account;



@end
