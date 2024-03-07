//
//  HTTPRequestAPI.m
//  aiyuke
//
//  Created by 唯赢 on 2017/12/11.
//  Copyright © 2017年 chengduweiying. All rights reserved.
//

#import "HTTPRequestAPI.h"

NSString *queryStringFromParameters(NSDictionary *parameter) {
    NSString *queryString = nil;
    if (parameter.count) {
        // 参数拼接
        NSMutableArray *keyValues = [[NSMutableArray alloc] init];
        for (NSString *key in parameter.allKeys) {
            id anyObject = [parameter objectForKey:key];
            NSString *value = anyObject;
            if ([anyObject isMemberOfClass:[NSArray class]]) {
                // 如果是数组,值按","拼接
                value = [((NSArray *)anyObject) componentsJoinedByString:@","];
            }
            
            [keyValues addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
        
        queryString = [keyValues componentsJoinedByString:@"&"];
    }
    
    return queryString;
}

@implementation HTTPRequestAPI

+ (NSString *)createURLWithRoot:(NSString *)root apiName:(NSString *)api parameter:(NSDictionary *)par {
    if (!api.length || !root.length)
    {
        return nil;
    }
    
    // 爱羽客APP接口规则:
    NSString *url = [root stringByAppendingString:@""];
    if (par.count)
    {
        // 参数拼接
        NSMutableArray *keyValues = [[NSMutableArray alloc] init];
        for (NSString *key in par.allKeys)
        {
            id anyObject = [par objectForKey:key];
            NSString *value = anyObject;
            if ([anyObject isMemberOfClass:[NSArray class]])
            {
                // 如果是数组,值按","拼接
                value = [((NSArray *)anyObject) componentsJoinedByString:@","];
            }
            
            [keyValues addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
        // 拼接keyValue
        url = [NSString stringWithFormat:@"%@&%@", url, [keyValues componentsJoinedByString:@"&"]];
    }
    
    return url;
}

+ (NSString *)createURLWithApi:(NSString *)api parameter:(NSDictionary *)parameter {
    return [self createURLWithRoot:(NSString *)HostName apiName:api parameter:parameter];
}

@end




