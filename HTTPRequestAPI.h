//
//  HTTPRequestAPI.h
//  aiyuke
//
//  Created by 唯赢 on 2017/12/11.
//  Copyright © 2017年 chengduweiying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequestManager.h"

/**
 使用参数字典创建链接参数字符串

 @param parameter 链接参数
 @return String
 */
FOUNDATION_EXTERN NSString *queryStringFromParameters(NSDictionary *parameter);

@interface HTTPRequestAPI : NSObject

/**
 创建完整的URL

 @param api API名称
 @param parameter 参数-链接中的参数
 @return 返回完整的链接字符串
 */
+ (NSString *)createURLWithApi:(NSString *)api parameter:(NSDictionary *)parameter;

/**
 创建完整的URL
 
 @param root 域名或者IP
 @param api API名称
 @param parameter 参数-链接中的参数
 @return 返回完整的链接字符串
 */
+ (NSString *)createURLWithRoot:(NSString *)root apiName:(NSString *)api parameter:(NSDictionary *)parameter;


@end





