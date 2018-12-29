//
//  SaveData.m
//  CarSharing
//
//  Created by 王振雨 on 2016/12/15.
//  Copyright © 2016年 CarSharing. All rights reserved.
//
//沙盒目录
#define DocumentPath  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define ACCOUNTFILE  [DocumentPath stringByAppendingString:@"/account.dat"]
#import "SaveData.h"

@implementation SaveData
+ (void)saveAccount:(LoginModel *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:ACCOUNTFILE];
}
+ (LoginModel *)account
{
    // 取出账号
    LoginModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:ACCOUNTFILE];
    return account;
}
+ (void)deleteAccount
{
    //    LoginModel *login = [NSKeyedUnarchiver unarchiveObjectWithFile:ACCOUNTFILE];
    id  object = nil;
    [NSKeyedArchiver archiveRootObject:object  toFile:ACCOUNTFILE];
}



@end
