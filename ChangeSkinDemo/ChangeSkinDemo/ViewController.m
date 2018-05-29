//
//  ViewController.m
//  ChangeSkinDemo
//
//  Created by het on 2017/10/9.
//  Copyright © 2017年 het. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+UIConfig.h"

#import "OneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"Skin" ofType:@"plist"];
//    
//    NSMutableDictionary * mutDicPath = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
//    NSMutableDictionary * mutDic = [NSMutableDictionary dictionary];
//    [mutDic setValue:@"0000FF" forKey:@"blue"];
//    [mutDic setValue:@"fd9c2e" forKey:@"yellow"];
//    [mutDic setValue:@"DC143C" forKey:@"red"];
//
//    [mutDic writeToFile:path atomically:YES];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 50)];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(nextPageBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)nextPageBtnDidClicked:(id)sender
{
    OneViewController * oneVC = [[OneViewController alloc] init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
