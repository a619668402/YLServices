//
//  MBProgressHUD+Toast.h
//  Base
//
//  Created by sky on 2018/6/12.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "YLMBProgressHUD.h"

@interface YLMBProgressHUD (Toast)

+ (void)showMessageWithView:(UIView *)view message:(NSString *)message;

+ (void)showMessageWithView:(UIView *)view message:(NSString *)message yOffset:(CGFloat)yOffest;

@end
