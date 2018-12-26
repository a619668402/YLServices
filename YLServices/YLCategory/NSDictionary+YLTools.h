//
//  NSDictionary+YLTools.h
//  jkxg
//
//  Created by sky on 2018/12/3.
//  Copyright © 2018年 tigonetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (YLTools)

/// 转换成JSON(没有可读性)
- (NSString *)yl_toJSONString;
/// 转换成JSON字符串(有可读性)
- (NSString *)yl_toReadableJSONString;
/// 转换为JSON数组
- (NSData *)yl_toJSONData;


@end

NS_ASSUME_NONNULL_END
