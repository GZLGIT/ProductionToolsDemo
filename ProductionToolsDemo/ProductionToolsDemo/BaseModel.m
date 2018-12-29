//
//  BaseModel.m
//  AIChaperoneBed
//
//  Created by 郭子立 on 2017/7/5.
//  Copyright © 2017年 GZL. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {


}

/*
//    NSDictionary *dic = @{@"id":@"1235", @"address":@{@"province":@"hangzhou"}};
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id", @"address":@"address.province"};// id关键字, 只需要address字典中 province所对应的值
}
*/

/*
 //    NSDictionary *dic = @{@"id":@"1235", @"address_xiaohu":@{@"province":@"hangzhou"}};
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    return [propertyName mj_underlineFromCamel];// 驼峰转下划线
    return [propertyName mj_camelFromUnderline];// 下划线转驼峰
}
*/

/*
// 数组school属性里面装的是字典 一个字典对应一个teacherModel模型
+ (NSDictionary*)mj_objectClassInArray {
    return @{@"shool":@"teacherModel"};
}
*/


@end
