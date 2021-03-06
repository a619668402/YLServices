//
//  NSString+DisplayTime.h
//  DYLTool
//
//  Created by sky on 2018/5/25.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DisplayTime)


/**
 通过时间戳计算时间差(几小时前,几天前)

 @param compareDate <#compareDate description#>
 @return <#return value description#>
 */
+ (NSString *)yl_compareCurrentTime:(NSTimeInterval)compareDate;


/**
 通过时间戳得出对应的时间
 @param timestamp 时间戳
 @return eg: 2018年12月12日
 */
+ (NSString *)yl_getDateStringWithTimestamp:(NSTimeInterval)timestamp;


/**
 //通过时间戳和显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return <#return value description#>
 */
+ (NSString *)yl_getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;


/**
 获取时间戳

 @return <#return value description#>
 */
+ (NSString *)yl_getTimeInterval;

@end
