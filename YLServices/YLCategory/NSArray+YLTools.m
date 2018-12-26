//
//  NSArray+YLTools.m
//  jkxg
//
//  Created by sky on 2018/12/3.
//  Copyright © 2018年 tigonetwork. All rights reserved.
//

#import "NSArray+YLTools.h"

@implementation NSArray (YLTools)

/// 转换成JSON(没有可读性)
- (NSString *)yl_toJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
    if (data == nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/// 转换成JSON字符串(有可读性)
- (NSString *)yl_toReadableJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/// 转换为JSON数组
- (NSData *)yl_toJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

@end
