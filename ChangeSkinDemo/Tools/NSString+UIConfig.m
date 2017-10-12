//
//  NSString+UIConfig.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import "NSString+UIConfig.h"

@implementation NSString (UIConfig)

- (NSUInteger)sam_hexValue {
    NSUInteger result = 0;
    sscanf([self UTF8String], "%lx", (unsigned long *)&result);
    return result;
}

@end
