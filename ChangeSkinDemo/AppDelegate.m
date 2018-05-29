//
//  AppDelegate.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setTabbarViewController];
    [self checkOrWritePlist];
    return YES;
}

#pragma mark - Helper Methods
- (void)setTabbarViewController
{
    self.window.bounds = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    
    OneViewController * oneVC = [[OneViewController alloc] init];
    UINavigationController * oneNav = [[UINavigationController alloc] initWithRootViewController:oneVC];
    oneNav.tabBarItem.title = @"第一页";
    oneNav.tabBarItem.themeMap = @{
                                   kTabBarItemKeyColorName:[UIColor blackColor],
                                   kTabBarItemKeySelectedColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                                   };
    
    TwoViewController * twoVC = [[TwoViewController alloc] init];
    UINavigationController * twoNav = [[UINavigationController alloc] initWithRootViewController:twoVC];
    twoNav.tabBarItem.title = @"第二页";
    twoNav.tabBarItem.themeMap = @{
                                   kTabBarItemKeyColorName:[UIColor blackColor],
                                   kTabBarItemKeySelectedColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                                   };
    
    ThreeViewController * threeVC = [[ThreeViewController alloc] init];
    UINavigationController * threeNav = [[UINavigationController alloc] initWithRootViewController:threeVC];
    threeNav.tabBarItem.title = @"第三页";
    threeNav.tabBarItem.themeMap = @{
                                   kTabBarItemKeyColorName:[UIColor blackColor],
                                   kTabBarItemKeySelectedColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                                   };
    
    UITabBarController * tabbarVC = [[UITabBarController alloc] init];
    tabbarVC.viewControllers = @[oneNav, twoNav, threeNav];
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
}

- (void)checkOrWritePlist
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"Skin" ofType:@"plist"];
    if (path == nil)
    {
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] ;
        NSString *infoFilePath = [cachesPath stringByAppendingPathComponent:@"Skin.plist"];
        NSMutableDictionary * mutDic = [NSMutableDictionary dictionary];
        
        [mutDic setValue:@{@"color":@"DC143C"} forKey:@"red"];
        [mutDic setValue:@{@"color":@"0000FF"} forKey:@"blue"];
        [mutDic setValue:@{@"color":@"fd9c2e"} forKey:@"yellow"];
        [mutDic setValue:@"blue" forKey:@"selectColor"];
        [mutDic writeToFile:infoFilePath atomically:YES];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
