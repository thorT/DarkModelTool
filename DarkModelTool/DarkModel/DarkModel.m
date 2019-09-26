//
//  DarkModel.m
//  Clock
//
//  Created by thor on 2019/9/26.
//  Copyright © 2019 MH. All rights reserved.
//

#import "DarkModel.h"

@implementation DarkModel


/**
 是否 暗景模式
*/
+ (BOOL)isDarkMode{
    if (@available(iOS 13.0, *)) {
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return YES;
        }else{
            return NO;
        }
    } else {
        return NO;
    }
}

/**
暗景模式 传入RGBColor 或者 UIColor
*/
+ (UIColor *)adaptColor:(UIColor *)color darkColor:(UIColor *)darkColor{
    if (@available(iOS 13.0, *)) {
         
   return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleDark) {
                return darkColor;
            }else{
                return color;
            }
        }];
    } else {
        // Fallback on earlier versions
        return color;
    }
}

/**
 暗景模式 16进制  默认 alpha=1
 */
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor{
    UIColor *color = [self colorWithHexString:hexColor alpha:1];
    UIColor *darkColor = [self colorWithHexString:hexDarkColor alpha:1];
    if (@available(iOS 13.0, *)) {
        UIColor *resultColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleDark) {
                return darkColor;
            }else{
                return color;
            }
        }];
        return resultColor;
    } else {
        // Fallback on earlier versions
        return color;
    }
}

/**
 暗景模式 16进制  自定义alpha
 */
+ (UIColor *)adaptHexColor:(NSString *)hexColor darkColor:(NSString *)hexDarkColor alpha:(CGFloat)alpha{
    UIColor *color = [self colorWithHexString:hexColor alpha:alpha];
    UIColor *darkColor = [self colorWithHexString:hexDarkColor alpha:alpha];
    if (@available(iOS 13.0, *)) {
        UIColor *resultColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleDark) {
                return darkColor;
            }else{
                return color;
            }
        }];
        return resultColor;
    } else {
        // Fallback on earlier versions
        return color;
    }
}


+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    hexString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRegularExpression *RegEx = [NSRegularExpression regularExpressionWithPattern:@"^[a-fA-F|0-9]{6}$" options:0 error:nil];
    NSUInteger match = [RegEx numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, hexString.length)];

    if (match == 0) {return [UIColor clearColor];}

    NSString *rString = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [hexString substringWithRange:NSMakeRange(4, 2)];
    unsigned int r, g, b;
    BOOL rValue = [[NSScanner scannerWithString:rString] scanHexInt:&r];
    BOOL gValue = [[NSScanner scannerWithString:gString] scanHexInt:&g];
    BOOL bValue = [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (rValue && gValue && bValue) {
        return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:alpha];
    } else {
        return [UIColor clearColor];
    }
}


@end
