//
//  NSDictionary+Safe.m
//  DYLTool
//
//  Created by sky on 2018/7/26.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (id)yl_objectForKey:(NSString *)key {
    if (key == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id object = [self objectForKey:key];
    if (object == nil || object == [NSNull null]) {
        return @"";
    }
    return object;
}

- (void)yl_setValue:(id)object forKey:(id)key {
    if ([key isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        [self setValue:@"" forKey:key];
    } else {
        [self setValue:object forKey:key];
    }
}

- (id)yl_keyForValue:(id)value {
    for (id key in self.allKeys) {
        if ([value isEqual:[self objectForKey:key]]) {
            return key;
        }
    }
    return nil;
}

+ (NSDictionary *)yl_dictionaryWithJsonString:(NSString *)str {
    if (str == nil || str.length == 0) {
        return nil;
    }
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSAssert(err, @"解析失败");
        return nil;
    }
    return dic;
}

@end
