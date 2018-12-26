//
//  NSString+Tools.m
//  DYLTool
//
//  Created by sky on 2018/5/25.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)

/**
 电话号码中间4位*显示
 
 @param phoneNumber 电话号码
 @return eg:135****0001
 */
+ (NSString *)yl_getSecrectStringWithPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber.length == 11) {
        NSMutableString *newStr = [NSMutableString stringWithString:phoneNumber];
        NSRange range = NSMakeRange(3, 4);
        [newStr replaceCharactersInRange:range withString:@"****"];
        return newStr;
    }
    return nil;
}


/**
 银行卡号中间8位*显示
 
 @param accountNumber 银行卡号
 @return <#return value description#>
 */
+ (NSString *)yl_getSecrectStringWithAccountNumber:(NSString *)accountNumber {
    NSMutableString *newStr = [NSMutableString stringWithString:accountNumber];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length > 12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
}


/**
 转为手机格式,默认为-
 
 @param mobile 手机号
 @return <#return value description#>
 */
+ (NSString *)yl_stringMobileFormat:(NSString *)mobile {
    if (mobile.length == 11) {
        NSMutableString *newStr = [[NSMutableString alloc] initWithString:mobile];
        [newStr insertString:@"-" atIndex:3];
        [newStr insertString:@"-" atIndex:8];
        return newStr;
    }
    return nil;
}


/**
 金额数字添加单位
 
 @param value 金额
 @return <#return value description#>
 */
+ (NSString *)yl_stringChineseFormat:(double)value {
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿", value / 100000000];
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万", value / 10000];
    } else {
        return [NSString stringWithFormat:@"%.0f", value];
    }
}


/**
 数字添加千分位
 
 @param num <#num description#>
 @return <#return value description#>
 */
+ (NSString *)yl_countNumAndChangeFormat:(NSString *)num {
    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat = @"###,###";
    return [moneyFormatter stringFromNumber:[num toNumber]];
}

- (NSNumber*)toNumber
{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number=[formatter numberFromString:self];
    return number;
}


/**
 计算文字宽度
 
 @param fontSize 字体
 @param maxHeight 最大高度
 @return <#return value description#>
 */
- (CGFloat)yl_widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight {
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:CGSizeMake(0, maxHeight) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size.width;
}

/**
 计算文字高度
 
 @param fontSize 字体
 @param width 最大宽度
 @return <#return value description#>
 */
- (CGFloat)yl_heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width {
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size.height;
}

/**
 移除小数末尾的0
 
 @return <#return value description#>
 */
- (NSString *)yl_removeUnwantedZero {
    if ([[self substringWithRange:NSMakeRange(self.length- 3, 3)] isEqualToString:@"000"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-4)]; // 多一个小数点
    } else if ([[self substringWithRange:NSMakeRange(self.length- 2, 2)] isEqualToString:@"00"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-2)];
    } else if ([[self substringWithRange:NSMakeRange(self.length- 1, 1)] isEqualToString:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else {
        return self;
    }
}


/**
 去掉前后空格
 
 @return <#return value description#>
 */
- (NSString *)yl_trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

/**
 返回字符串中的所有数字

 @return 字符串中的所有数字
 */
- (NSString *)yl_allNumberOfString {
    NSMutableArray *characters = [NSMutableArray array];
    NSMutableString *mutStr = [NSMutableString string];
    // 分离出字符串中所有的字符, 并存储到数组characters中
    for (int i = 0; i < self.length; i ++) {
        NSString *subString = [self substringToIndex:i + 1];
        subString = [subString substringFromIndex:i];
        [characters addObject:subString];
    }
    // 利用正则表达式,匹配数组中的每一个元素,判断是否是数字,将数字拼接在可变字符串
    for (NSString *b in characters) {
        NSString  *regex = @"^[0-9]*$";
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        BOOL isShu = [pre evaluateWithObject:b];
        if (isShu) {
            [mutStr appendString:b];
        }
    }
    return mutStr;
}

/**
 返回字符串中的数字

 @return 字符串中的数字
 */
- (NSString *)yl_numberOfString {
     NSScanner *scanner = [NSScanner scannerWithString:self];
     [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
     int number;
     [scanner scanInt:&number];
     return [NSString stringWithFormat:@"%d", number];
}

- (NSString *)yl_replaceStringWithPattern:(NSString *)pattern replaceStr:(NSString *)replaceStr {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    return [regularExpression stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:replaceStr];
}

@end
