//
//  BaseResponse.h
//  NetWorkTool
//
//  Created by sky on 2018/5/15.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *code;

@property (nonatomic) id data;

/// 存对象
+ (void)yl_saveData:(id)data key:(NSString *)key;
/// 读对象
+ (id)yl_getDataWithKey:(NSString *)key;

@end
