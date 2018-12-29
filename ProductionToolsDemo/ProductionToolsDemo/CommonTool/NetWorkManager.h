//
//  NetWorkManager.h
//  AIChaperoneBed
//
//  Created by 郭子立 on 2017/7/9.
//  Copyright © 2017年 GZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetWorkManager : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (NetWorkManager *)shareNetWorkManagerTool;


/**
 Get 请求

 @param url 请求网址
 @param parameter 请求参数
 @param success 成功回调
 @param fail 失败回调
 */
- (void)GETRequestWithURLStr:(NSString *)url parametersDict:(NSDictionary *)parameter successBlock:(void(^)(id response))success failConnetion:(void(^)(BOOL failed))fail;

/**
 Post 请求

 @param url 请求网址
 @param parmaters 请求参数
 @param successBlock 成功回调
 @param failedBlock 失败回调
 */
- (void)postRequestWithURLStr:(NSString *)url parmaters:(id)parmaters successBlock:(void(^)(id response))successBlock failedBlock:(void(^)(id response))failedBlock;



/**
 支付请求

 @param urlStr 请求网址
 @param paramDic 请求参数
 @param successBlock 成功回调
 @param failedBlock 失败回调
 */
- (void)requestPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic successBlock:(void(^)(id response))successBlock failedBlock:(void(^)(id response))failedBlock;



/**
 图片上传

 @param urlStr 请求网址
 @param paramDic 请求参数
 @param finish 成功回调
 @param enError 失败回调
 */
- (void)upImgDataPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(void(^)(id responseObject))finish enError:(void(^)(NSError *error))enError;

- (NSString*)dictConversionJsonStrWith:(id)dict;

//网络状态
- (void)netWorkStatuBlock:(void(^)(NSInteger status))block;

// 取消所有的网络任务
- (void)cancelAllTask;
+(NSString *)md5OfString:(NSString *)str;
@end
