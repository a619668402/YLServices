//
//  UIViewController+Toast.m
//  DYLTool
//
//  Created by sky on 2018/6/26.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "UIViewController+Toast.h"
#import "YLMBProgressHUD+Toast.h"

@implementation UIViewController (Toast)

- (void)yl_toast:(NSString *)message {
    [YLMBProgressHUD showMessageWithView:self.view message:message];
}

- (void)yl_toast:(NSString *)message yOffset:(CGFloat)yOffset {
    [YLMBProgressHUD showMessageWithView:self.view message:message yOffset:yOffset];
}

@end
