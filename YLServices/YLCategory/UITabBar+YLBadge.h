//
//  UITabBar+YLBadge.h
//  jkxg
//
//  Created by sky on 2018/11/5.
//  Copyright © 2018年 tigonetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (YLBadge)
/// 显示小红点
- (void)showBadgeOnItemIndex:(int)index;
/// 隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
