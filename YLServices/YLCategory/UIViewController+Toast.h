//
//  UIViewController+Toast.h
//  DYLTool
//
//  Created by sky on 2018/6/26.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Toast)

- (void)yl_toast:(NSString *)message;

- (void)yl_toast:(NSString *)message yOffset:(CGFloat)yOffset;

@end
