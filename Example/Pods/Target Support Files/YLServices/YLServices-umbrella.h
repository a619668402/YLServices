#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MacrosConstant.h"
#import "MacrosDefine.h"
#import "MacrosSingleton.h"
#import "MacrosTools.h"
#import "YLMBProgressHUD+Toast.h"
#import "YLMBProgressHUD.h"

FOUNDATION_EXPORT double YLServicesVersionNumber;
FOUNDATION_EXPORT const unsigned char YLServicesVersionString[];

