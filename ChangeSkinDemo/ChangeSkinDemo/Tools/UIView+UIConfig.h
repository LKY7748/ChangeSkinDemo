//
//  UIView+UIConfig.h
//  ChangeSkinDemo
//
//  Created by het on 2017/10/10.
//  Copyright © 2017年 het. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *kThemeMapKeyImageName;
extern NSString *kThemeMapKeyHighlightedImageName;
extern NSString *kThemeMapKeySelectedImageName;
extern NSString *kThemeMapKeyDisabledImageName;

extern NSString *kThemeMapKeyColorName;
extern NSString *kThemeMapKeyHighlightedColorName;
extern NSString *kThemeMapKeySelectedColorName;
extern NSString *kThemeMapKeyDisabledColorName;

extern NSString *kThemeMapKeyBgColorName;

extern NSString *kThemeMapKeyMinValueImageName;
extern NSString *kThemeMapKeyMaxValueImageName;

extern NSString *kThemeMapKeyThumbImageName;
extern NSString *kThemeMapKeyHighlightedThumbImageName;
extern NSString *kThemeMapKeyDisabledThumbImageName;

extern NSString *kThemeMapKeyMinTrackImageName;
extern NSString *kThemeMapKeyHighlightedMinTrackImageName;
extern NSString *kThemeMapKeyDisabledMinTrackImageName;

extern NSString *kThemeMapKeyMaxTrackImageName;
extern NSString *kThemeMapKeyHighlightedMaxTrackImageName;
extern NSString *kThemeMapKeyDisabledMaxTrackImageName;

extern NSString *kThemeMapKeyMinTrackTintColorName;
extern NSString *kThemeMapKeyMaxTrackTintColorName;

@interface UIView (UIConfig)

@property (nonatomic, copy) NSDictionary *themeMap;

@end
