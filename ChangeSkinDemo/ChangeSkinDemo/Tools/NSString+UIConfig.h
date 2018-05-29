//
//  NSString+UIConfig.h
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UIConfig)

- (NSUInteger)sam_hexValue;

- (void)setStringWithKey:(NSString *)key;
+ (NSDictionary *)getDicWithKey:(NSString *)key;

@end
