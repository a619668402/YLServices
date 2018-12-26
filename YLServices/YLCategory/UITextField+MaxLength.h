//
//  UITextField+MaxLength.h
//  DYLTool
//
//  Created by sky on 2018/6/26.
//  Copyright © 2018年 DYL. All rights reserved.
//
/*********************************************
                限制最大长度
 *********************************************/
#import <UIKit/UIKit.h>

@interface UITextField (MaxLength)

- (void)yl_limitMaxLength:(NSInteger)maxLength;

@end
