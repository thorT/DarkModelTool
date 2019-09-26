//
//  DarkModel.h
//  Clock
//
//  Created by thor on 2019/9/26.
//  Copyright © 2019 MH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

NS_ASSUME_NONNULL_BEGIN

@interface DarkModel : NSObject

/**
 是否 暗景模式
*/
+ (BOOL)isDarkMode;

/**
暗景模式 传入RGBColor 或者 UIColor
*/
+ (UIColor *)adaptColor:(UIColor *)color darkColor:(UIColor *)darkColor;

/**
 暗景模式 16进制  默认 alpha=1
 */
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor;

/**
 暗景模式 16进制  自定义alpha
 */
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
