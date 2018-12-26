//
//  UITextView+MaxLength.m
//  DYLTool
//
//  Created by sky on 2018/6/26.
//  Copyright © 2018年 DYL. All rights reserved.
//

#import "UITextView+MaxLength.h"
#import "ReactiveObjC.h"

@implementation UITextView (MaxLength)

- (void)yl_limitMaxLength:(NSInteger)maxLength {
    @weakify(self);
    [[[RACSignal merge:@[RACObserve(self, text), self.rac_textSignal]] skip:0] subscribeNext:^(NSString *text) {
        @strongify(self);
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字,则对已输入的文字进行字数统计,防止中文被截断
        if (position) {
            return ;
        }
        if (text.length <= maxLength) {
            return ;
        }
        // 中文和emoji表情存在的问题,需要对此进行处理
        NSRange range;
        NSUInteger inputLength = 0;
        for (int i = 0; i < text.length && inputLength <= maxLength; i += range.length) {
            range = [self.text rangeOfComposedCharacterSequenceAtIndex:i];
            inputLength += [text substringWithRange:range].length;
            if (inputLength > maxLength) {
                self.text = [text substringWithRange:NSMakeRange(0, range.location)];
            }
        }
    }];
}

@end
