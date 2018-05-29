//
//  OneViewController.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import "OneViewController.h"
#import "ChangeSkinManager.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"第一页";
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 50)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"变色咯" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.themeMap = @{
                        kThemeMapKeyBgColorName:[ChangeSkinManager setSkinColorWithStr:@""],
                        kThemeMapKeyColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                        };
    [button addTarget:self action:@selector(changeSkin1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 170, 120, 50)];
    button1.backgroundColor = [UIColor redColor];
    button1.themeMap = @{
                         kThemeMapKeyBgColorName:[ChangeSkinManager setSkinColorWithStr:@""],
                         kThemeMapKeyColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                         };
    [button1 addTarget:self action:@selector(changeSkin2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 120, 50)];
    button1.backgroundColor = [UIColor blueColor];
    button2.themeMap = @{
                         kThemeMapKeyBgColorName:[ChangeSkinManager setSkinColorWithStr:@""],
                         kThemeMapKeyColorName:[ChangeSkinManager setSkinColorWithStr:@""]
                         };
    [button2 addTarget:self action:@selector(changeSkin3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)changeSkin1:(UIButton *)button
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] ;
    NSString *infoFilePath = [cachesPath stringByAppendingPathComponent:@"Skin.plist"];
    NSDictionary * dic = [NSString getDicWithKey:@"Skin.plist"];
    [dic setValue:@"blue" forKey:@"selectColor"];
    [dic writeToFile:infoFilePath atomically:YES];
    [self changeSkin];
}

- (void)changeSkin2:(UIButton *)button
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] ;
    NSString *infoFilePath = [cachesPath stringByAppendingPathComponent:@"Skin.plist"];
    NSDictionary * dic = [NSString getDicWithKey:@"Skin.plist"];
    [dic setValue:@"red" forKey:@"selectColor"];
    [dic writeToFile:infoFilePath atomically:YES];
    [self changeSkin];
}

- (void)changeSkin3:(UIButton *)button
{
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] ;
    NSString *infoFilePath = [cachesPath stringByAppendingPathComponent:@"Skin.plist"];
    NSDictionary * dic = [NSString getDicWithKey:@"Skin.plist"];
    [dic setValue:@"yellow" forKey:@"selectColor"];
    [dic writeToFile:infoFilePath atomically:YES];
    [self changeSkin];
}

- (void)changeSkin
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
