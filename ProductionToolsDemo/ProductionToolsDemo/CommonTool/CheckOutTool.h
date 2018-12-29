//
//  CheckOutTool.h
//  CarSharing
//
//  Created by 王振雨 on 2016/12/14.
//  Copyright © 2016年 CarSharing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>
@interface CheckOutTool : NSObject

+ (CheckOutTool *)shareCommonTool;

//判断文本是否满足，YES:6-16位,NO:反之
+(bool)checkRange:(NSString*)strmessage;
+(bool)checkLenght:(NSString*)strmessage;
//判断是否为手机号
+(bool)checkPhone:(NSString*)strphone;
/*车牌号验证 MODIFIED BY HELENSONG*/
+(BOOL)checkValidateCarNo:(NSString *)carNo;

//判断字符串是否为空
+(BOOL)checkIsEmpty:(NSString*)emptyStr;

// 判断字符是否包含中文字符
+ (BOOL)isHasChineseWithStr:(NSString *)strFrom;


/**
 比较两个时间字符串

 @param timeAStr 时间字符串A
 @param timeBStr 时间字符串B
 @return A日期早于或等于日期B 返回YES
 */
+ (BOOL)compareDateTimeStrWith:(NSString*)timeAStr withTimeStr:(NSString*)timeBStr;


//判断字符串是否是身份证号
+ (BOOL)checkValidateIdentityCard: (NSString *)identityCard;
//判断用户名是否合法
+(bool)checkName:(NSString*)strName;
//银行卡号校验
+ (BOOL) checkBankCardNo:(NSString*) cardNo;

+ (BOOL)checkSepaterString;
+ (void)showMessage:(NSString *)msg;
+ (void)hideMessage;
+ (void)showToast:(NSString *)msg delay:(NSUInteger)delay;

// 判断文件是否存在;
+ (BOOL)isHaveFilesAtPath;
+ (NSString *)documentsPath:(NSString *)fileName;
// 删除文件
+ (void)deletePathFiles:(NSString*)flieName;

// 判断是否全为字符串
+ (BOOL)isNum:(NSString *)checkedNumString;

// 判断是否为表情符号
+ (BOOL)stringContainsEmoji:(NSString *)string;

// 手机型号
+ (NSString*)iPhoneType;


/**
 计算字符串高度

 @param string 字符串
 @param fontSize 指定字号大小
 @param width 宽度限定
 @return 返回高度
 */
+ (CGFloat)calculateRowHeight:(NSString *)string fontSize:(NSInteger)fontSize controlWidth:(CGFloat)width;

/**
 计算字符串高度

 @param string 字符串
 @param fontSize 指定字号大小
 @param height 高度限定
 @return 返回宽度
 */
+ (CGFloat)calculateRowWidth:(NSString *)string fontSize:(NSInteger)fontSize controlHeight:(CGFloat)height;
/**
 大写转小写金额

 @param numstr 小写金额
 @return 大写金额
 */
+ (NSString *)digitUppercase:(NSString *)numstr;


/**
 计算字符串宽高

 @param fontSize 字体大小
 @param text 字符串
 @param needWidth 最大宽度
 @param lineSpacing 行间距
 @return 字符串大小
 */
+ (CGRect)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth lineSpacing:(CGFloat )lineSpacing;


/**
 调整行间距、字间距

 @param string 初始字符串
 @param lineSpace 行间距 为0不设置
 @param columnSpace 字间距 为0不设置
 @return 富文本
 */
+ (NSMutableAttributedString *)atttibutedStringForString:(NSString *)string LineSpace:(CGFloat)lineSpace ColumnSpace:(CGFloat)columnSpace;

@end
