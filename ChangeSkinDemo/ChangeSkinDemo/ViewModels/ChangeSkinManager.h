//
//  ChangeSkinManager.h
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ChangeSkinManager : NSObject

+ (UIImage *)setSkinImageWithStr:(NSString *)str;
+ (UIColor *)setSkinColorWithStr:(NSString *)str;

@end
