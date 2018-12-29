//
//  NetWorkManager.m
//  AIChaperoneBed
//
//  Created by 郭子立 on 2017/7/9.
//  Copyright © 2017年 GZL. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>

static NetWorkManager * shareNetWorkManagerTool;

@implementation NetWorkManager

+ (NetWorkManager *)shareNetWorkManagerTool
{
    static NetWorkManager * shareNetWorkManagerTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareNetWorkManagerTool =[[NetWorkManager alloc]init];
    });
    return shareNetWorkManagerTool;
}
- (id)init
{
    
    if (shareNetWorkManagerTool)
    {
        // 如果单例对象存在则抛出异常
        NSException *exception = [NSException exceptionWithName:@"重复创建单例对象异常" reason:@"请使用NetWorkManager的单例方法." userInfo:nil];
        [exception raise];
    }
    _manager = [AFHTTPSessionManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _manager.requestSerializer.timeoutInterval = 15.0f;
    [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return self;
}


//get请求
- (void)GETRequestWithURLStr:(NSString *)url parametersDict:(NSDictionary *)parameter successBlock:(void(^)(id response))success failConnetion:(void(^)(BOOL failed))fail {
    
    
    [_manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"数据数据信息%@----%@----%@",url,parameter,responseObject);
        NSDictionary *dictionary=(NSDictionary *)responseObject;
        if ([dictionary[@"status"] integerValue] == 0)
        {
            success(dictionary);
        }
        else
        {
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误信息******%@",error);
        fail(YES);
        //[CommonTool showToast:@"网络异常" delay:2.0];
    }];
    
}


// post请求
- (void)postRequestWithURLStr:(NSString *)url parmaters:(id)parmaters successBlock:(void(^)(id response))successBlock failedBlock:(void(^)(id response))failedBlock {

    
    
    // 指定我们我们能够解析的数据类型包含text/html
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    _manager.responseSerializer = [AFJSONResponseSerializer  serializer];
    
    [self netWorkStatuBlock:^(NSInteger status) {
        if (status == 1)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"postFinishXunJianData" object:nil];
            [self.manager POST:url parameters:parmaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [CheckOutTool hideMessage];
                successBlock(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [CheckOutTool hideMessage];
                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"输出数据信息ahah>>>>服务器错误原因****%@\n>>>%@\n>>>>%@",error,[error localizedDescription],str);
                if (failedBlock) {
                    failedBlock(error);
                }
                if (error.code == -1001) {
                    [CheckOutTool showToast:@"网络太差,链接超时" delay:2];
                }
            }];
        }else{
            failedBlock(@"网络异常");
        }
    }];
}


// 支付请求
- (void)requestPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic successBlock:(void(^)(id response))successBlock failedBlock:(void(^)(id response))failedBlock {
    
    
    _manager.responseSerializer.acceptableContentTypes
    = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    _manager.responseSerializer = [AFJSONResponseSerializer  serializer];
    
    [self netWorkStatuBlock:^(NSInteger status) {
        if (status == 1)
        {
            //返回值不同不能统一处理
            [self.manager POST:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [CheckOutTool hideMessage];
                NSDictionary * dic =(NSDictionary *)responseObject;
                if (responseObject == nil)
                {
                    failedBlock(nil);
                    return ;
                }
                successBlock(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [CheckOutTool hideMessage];
                failedBlock(error);
                
                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"输出数据信息ahah>>>>服务器错误原因****%@\n>>>%@\n>>>>%@",error,[error localizedDescription],str);
            }];
        }
    }];
    
    
    
}

// 上传图片
- (void)upImgDataPOSTWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic finish:(void(^)(id responseObject))finish enError:(void(^)(NSError *error))enError{
    
    
    // 指定我们我们能够解析的数据类型包含text/html
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    
    [_manager POST:urlStr parameters:paramDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 要上传保存在服务器中的名称
        // 使用时间来作为文件名 2014-04-30 14:20:57.png
        // 让不同的用户信息,保存在不同目录中
        
        
        [paramDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            if ([key isEqualToString:@"img1"]) {
                
                [formData appendPartWithFileData:obj name:@"img1" fileName:@"shop.png" mimeType:@"image/png"];
            }
            
            if ([key isEqualToString:@"img2"]) {
                
                [formData appendPartWithFileData:obj name:@"img2" fileName:@"shop.png" mimeType:@"image/png"];
            }
            
        }];
        
        
    } progress:nil  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [CheckOutTool hideMessage];
        finish(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [CheckOutTool hideMessage];
        NSLog(@"上传图片失败=========%@",error);
    }];
}


- (void)netWorkStatuBlock:(void(^)(NSInteger status))block
{
    //1.创建网络状态监测管理者
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
    
    //2.监听改变
    [manger startMonitoring];
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                NSLog(@"未知");
                block(1);
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"网络链接已断开！");
                [CheckOutTool hideMessage];
                [CheckOutTool showToast:@"网络链接已断开！" delay:3.0];
                block(0);
                return ;
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"3G|4G");
                block(1);
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"WiFi");
                block(1);
            }
                break;
            default:
                break;
        }
    }];
}


// 取消所有的网络任务
- (void)cancelAllTask {
    
    if ([_manager.tasks count] != 0) {
        [_manager.tasks[0] cancel];
    }
}

#pragma mark--json转换
- (NSString *)dictConversionJsonStrWith:(id)dict {
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:(NSJSONWritingPrettyPrinted) error:nil];
    
    NSString *resultStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSMutableString *mutStr = [NSMutableString stringWithString:resultStr];
    
    // 去掉空格
    NSRange range = {0, resultStr.length};
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    // 去掉换行
    NSRange range2 = {0, mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    /*
     // 去掉斜杠
     NSRange range3 = {0, mutStr.length};
     
     [mutStr replaceOccurrencesOfString:@"\\" withString:@"" options:NSLiteralSearch range:range3];
     */
    return mutStr;
}

#pragma mark -md5加密方法
+(NSString *)md5OfString:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}

@end
