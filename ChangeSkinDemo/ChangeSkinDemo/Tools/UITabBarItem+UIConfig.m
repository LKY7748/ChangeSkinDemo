//
//  UITabBarItem+UIConfig.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/11.
//  Copyright © 2017年 het. All rights reserved.
//

#import "UITabBarItem+UIConfig.h"

/**
 * 设置图片
 */
NSString *kTabBarItemKeyImageName             = @"kTabBarItemKeyImageName";
/**
 * 设置选中图片
 */
NSString *kTabBarItemKeySelectedImageName     = @"kTabBarItemKeySelectedImageName";
/**
 * 设置文字颜色
 */
NSString *kTabBarItemKeyColorName             = @"kTabBarItemKeyColorName";
/**
 * 设置选中文字颜色
 */
NSString *kTabBarItemKeySelectedColorName     = @"kTabBarItemKeySelectedColorName";


static void *kUIView_ThemeMap;
static void *kUIView_DeallocHelper;

@implementation UITabBarItem (UIConfig)

- (void)setThemeMap:(NSDictionary *)themeMap
{
    objc_setAssociatedObject(self, &kUIView_ThemeMap, themeMap, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (themeMap) {
        @autoreleasepool {
            // Need to removeObserver in dealloc
            if (objc_getAssociatedObject(self, &kUIView_DeallocHelper) == nil) {
                __unsafe_unretained typeof(self) weakSelf = self; // NOTE: need to be __unsafe_unretained because __weak var will be reset to nil in dealloc
                id deallocHelper = [self addDeallocBlock:^{
                    NSLog(@"deallocing %@", weakSelf);
                    [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
                }];
                objc_setAssociatedObject(self, &kUIView_DeallocHelper, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
            }
            
            [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChanged) name:kThemeDidChangeNotification object:nil];
            [self themeChanged];
        }
    }
    else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    }
    
}

- (NSDictionary *)themeMap
{
    return objc_getAssociatedObject(self, &kUIView_ThemeMap);
}

- (void)themeChanged
{
    // TODO: performace tuning
    dispatch_async(dispatch_get_main_queue(), ^{
        [self changeTheme];
    });
}

- (void)changeTheme
{
    NSDictionary *map = self.themeMap;
    if (map[kTabBarItemKeyImageName])
    {
        self.image = TImage(map[kTabBarItemKeyImageName]);
    }
    if (map[kTabBarItemKeySelectedImageName])
    {
        self.selectedImage = TImage(map[kTabBarItemKeySelectedImageName]);
    }
    if (map[kTabBarItemKeyColorName])
    {
        [self setTitleTextAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:TColor(map[kTabBarItemKeyColorName]) ,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
    if (map[kTabBarItemKeySelectedColorName])
    {
        [self setTitleTextAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:TColor(map[kTabBarItemKeySelectedColorName]) ,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    }
}

@end
