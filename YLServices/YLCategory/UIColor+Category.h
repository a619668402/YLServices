//
//  UIColor+Category.h
//  DYLTool
//
//  Created by sky on 2018/5/25.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  功能:通过RGB创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *
 *  @return UIColor
 *
 *  example: rgb(173.0,23.0,11.0)
 */
UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue);

/**
 *  功能:通过RGB以及alpha创建颜色
 *
 *  @param red <CGFloat> <范围:0~255.0>
 *  @param green <CGFloat> <范围:0~255.0>
 *  @param blue <CGFloat> <范围:0~255.0>
 *  @param alpha <CGFloat> <范围:0~1.0>
 *
 *  @return UIColor
 *
 *  example: rgbA(173.0,23.0,11.0,0.5)
 */
UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

@interface UIColor (Category)

/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hexString NSString
 *
 *  @return Returns the UIColor instance
 */
+ (UIColor *)yl_hex:(NSString *)hexString;

/**
 *  通过0xffffff的16进制数字创建颜色
 *
 *  @param aRGB 0xffffff
 *
 *  @return UIColor
 */
+ (UIColor *)yl_colorWithRGB:(NSUInteger)aRGB;


/**
 调节颜色的明亮度
 @param color 颜色
 @param delta 明亮度
 @return <#return value description#>
 */
+ (UIColor *)yl_colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta;


/**
 调整颜色的透明度
 @param color 颜色
 @param delta 透明度
 @return <#return value description#>
 */
+ (UIColor *)yl_colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;

/**
 绘制渐变色
 eg:
 UIView *sysView = [UIView new];
 [sysView setFrame:CGRectMake(60, 60, 100, 40)];
 sysView.layer.cornerRadius = 20.0;
 sysView.layer.masksToBounds = YES;
 [sysView.layer addSublayer:[UIColor setGradualChangingColor:sysView fromColor:@"F76B1C" toColor:@"FBDA61"]];
 [self.view addSubview:sysView];
 
 @param view <#view description#>
 @param fromHexColorStr <#fromHexColorStr description#>
 @param toHexColorStr <#toHexColorStr description#>
 @return <#return value description#>
 */
+ (CAGradientLayer *)yl_setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

/**
 获取当前UIColor对象里面的透明色值
 
 @return 透明通道色值,值范围0.0 - 1.0
 */
- (CGFloat)yl_alpha;

/**
 获取当前UIColor对象里面的红色色值
 
 @return 红色通道色值,值范围0.0 - 1.0
 */
- (CGFloat)yl_red;

/**
 获取当前UIColor对象里面蓝色色值
 
 @return 蓝色通道色值,值范围0.0 - 1.0
 */
- (CGFloat)yl_blue;

/**
 获取当前UIColor对象里面绿色色值
 
 @return 绿色通道色值,值范围0.0 - 1.0
 */
- (CGFloat)yl_green;

/**
 随机颜色
 
 @return <#return value description#>
 */
+ (UIColor *)yl_randomColor;


@end
