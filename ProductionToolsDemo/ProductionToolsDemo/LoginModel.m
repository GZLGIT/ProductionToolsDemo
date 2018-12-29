//
//  LoginModel.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/24.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (LoginModel *)sharedLoginModel;
{
    static LoginModel *sharedLoginModel = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedLoginModel =[[LoginModel alloc]init];
    });
    return sharedLoginModel;
}

MJCodingImplementation

@end
