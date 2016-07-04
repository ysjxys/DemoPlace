//
//  MJViewController.m
//  04-通过代码创建按钮
//
//  Created by apple on 14-3-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

#pragma mark 控制器的view加载完毕的时候调用
// 一般在这里进行界面的初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"-----viewDidLoad");

    // 添加
    
    // 1.创建按钮
    UIButton *btn = [[UIButton alloc] init];
    
    // 2.添加按钮
    [self.view addSubview:btn];
    
    // 3.设置frame
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    // 4.设置背景色
    btn.backgroundColor = [UIColor blueColor];
    
//    UIImage *image = [UIImage imageNamed:@"btn_01"];
//    [btn setBackgroundImage:image forState:uicontrolstate];
}

@end
