//
//  UIColor+Category.m
//  DYLTool
//
//  Created by sky on 2018/5/25.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)yl_hex:(NSString *)hexString
{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return [UIColor blackColor];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor blackColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


+ (UIColor *)yl_colorWithRGB:(NSUInteger)aRGB
{
    return [UIColor colorWithRed:((float)((aRGB & 0xFF0000) >> 16))/255.0 green:((float)((aRGB & 0xFF00) >> 8))/255.0 blue:((float)(aRGB & 0xFF))/255.0 alpha:1.0];
}


+ (UIColor *)yl_colorRGBonvertToHSB:(UIColor*)color withBrighnessDelta:(CGFloat)delta {
    CGFloat hue = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha = 0.0f;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    brightness += delta;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)yl_colorRGBonvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta {
    CGFloat hue = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha = 0.0f;
    
    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    alpha += delta;
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (CAGradientLayer *)yl_setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.frame;
    // 创建渐变色数组,需要转换为CGColor
    gradientLayer.colors = @[(__bridge id)[UIColor yl_hex:fromHexColorStr].CGColor, (__bridge id)[UIColor yl_hex:toHexColorStr].CGColor];
    // 设置渐变色方向,左上点为(0,0),右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    // 设置颜色变化点,取值范围0.0~1.0
    gradientLayer.locations = @[@0, @1];
    return gradientLayer;
}

- (CGFloat)yl_alpha {
    CGFloat a;
    if ([self getRed:0 green:0 blue:0 alpha:&a]) {
        return a;
    }
    return 0;
}

- (CGFloat)yl_red {
    CGFloat r;
    if ([self getRed:&r green:0 blue:0 alpha:0]) {
        return r;
    }
    return 0;
}

- (CGFloat)yl_blue {
    CGFloat b;
    if ([self getRed:0 green:0 blue:&b alpha:0]) {
        return b;
    }
    return 0;
}

- (CGFloat)yl_green {
    CGFloat g;
    if ([self getRed:0 green:&g blue:0 alpha:0]) {
        return g;
    }
    return 0;
}

+ (UIColor *)yl_randomColor {
    CGFloat red = (arc4random() % 255 / 255.0);
    CGFloat green = (arc4random() % 255 / 255.0);
    CGFloat blue = (arc4random() % 255 / 255.0);
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@end

UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
