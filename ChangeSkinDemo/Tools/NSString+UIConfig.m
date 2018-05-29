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

- (void)setStringWithKey:(NSString *)key
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] ;
    NSString *infoFilePath = [cachesPath stringByAppendingPathComponent:key];
    [self writeToFile:infoFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

+ (NSDictionary *)getDicWithKey:(NSString *)key
{
    NSString *infoFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",key]];
    return [NSDictionary dictionaryWithContentsOfFile:infoFilePath];
}

@end
