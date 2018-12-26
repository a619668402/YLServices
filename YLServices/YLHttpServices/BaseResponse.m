//
//  BaseResponse.m
//  NetWorkTool
//
//  Created by sky on 2018/5/15.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse

+ (void)yl_saveData:(id)data key:(NSString *)key  {
    [KSaveHelper yl_saveValue:[NSKeyedArchiver archivedDataWithRootObject:data] key:key];
}

+ (id)yl_getDataWithKey:(NSString *)key {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[KSaveHelper yl_readObjectWithKey:key]];
}

@end
