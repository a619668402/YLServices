//
//  UIImageView+LoadImg.m
//  DYLTool
//
//  Created by sky on 2018/6/25.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "UIImageView+LoadImg.h"
#import "YYWebImage.h"

@implementation UIImageView (LoadImg)

- (void)yl_loadImgWithUrlStr:(NSString *)urlStr placeHolderImgStr:(NSString *)placeHolderImgStr {
    [self yy_setImageWithURL:[NSURL URLWithString:urlStr] placeholder:[UIImage imageNamed:placeHolderImgStr]];
}

- (void)yl_loadImgWithUrlStr:(NSString *)urlStr {
    [self yy_setImageWithURL:[NSURL URLWithString:urlStr] options:YYWebImageOptionProgressiveBlur|YYWebImageOptionSetImageWithFadeAnimation];
}

@end
