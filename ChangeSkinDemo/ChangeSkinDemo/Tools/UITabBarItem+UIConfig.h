//
//  UITabBarItem+UIConfig.h
//  ChangeSkinDemo
//
//  Created by het on 2017/10/11.
//  Copyright © 2017年 het. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *kTabBarItemKeyImageName;
extern NSString *kTabBarItemKeySelectedImageName;

extern NSString *kTabBarItemKeyColorName;
extern NSString *kTabBarItemKeySelectedColorName;

@interface UITabBarItem (UIConfig)

@property (nonatomic, copy) NSDictionary *themeMap;

@end
