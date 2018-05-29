//
//  ChangeSkinManager.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import "ChangeSkinManager.h"

@implementation ChangeSkinManager

+ (UIImage *)setSkinImageWithStr:(NSString *)str
{
    NSDictionary * dict = [NSString getDicWithKey:@"Skin.plist"];
    if ([dict.allKeys containsObject:@"selectColor"])
    {
        NSString * key = [dict objectForKey:@"selectColor"];
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@_%@", str, key]];
    }
    
    return nil;
}

+ (UIColor *)setSkinColorWithStr:(NSString *)str
{
    NSDictionary * dict = [NSString getDicWithKey:@"Skin.plist"];
    if ([dict.allKeys containsObject:@"selectColor"])
    {
        NSString * key = [dict objectForKey:@"selectColor"];
        NSDictionary * dic = [dict objectForKey:key];
        NSString * colorStr = [dic objectForKey:@"color"];
        return [UIColor sam_colorWithHex:colorStr];
    }
    return [UIColor clearColor];
}

@end
