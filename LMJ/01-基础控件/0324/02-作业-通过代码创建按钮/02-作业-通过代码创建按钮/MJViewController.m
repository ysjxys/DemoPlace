//
//  MJViewController.m
//  02-作业-通过代码创建按钮
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建按钮
    UIButton *btn = [[UIButton alloc] init];
    
    // 2.添加按钮
    [self.view addSubview:btn];
    
    // 3.设置frame
    btn.frame = CGRectMake(50, 50, 100, 100);
    
    // 4.设置背景图片
    // 4.1.通过文件名加载图片(凡是PNG图片,都不用加拓展名)
    UIImage *normal = [UIImage imageNamed:@"btn_01"];
    // 4.2.设置普通状态下的背景图片
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    
    // 4.3.加载高亮的图片
    UIImage *high = [UIImage imageNamed:@"btn_02"];
    [btn setBackgroundImage:high forState:UIControlStateHighlighted];
    
    // 5.设置文字
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    
    // 6.设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    // 7.监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn2.center = CGPointMake(250, 250);
    [self.view addSubview:btn2];
}

- (void)btnClick:(UIButton *)button
{
    NSLog(@"btnClick----------%@", button);
}


- (void)btn2Click
{
    NSLog(@"btn2Click----------");
}

@end
