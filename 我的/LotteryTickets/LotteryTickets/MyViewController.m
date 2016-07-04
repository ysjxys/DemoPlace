//
//  MyViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MyViewController.h"
#import "UIImage+Extension.h"
#import "SettingViewController.h"

@implementation MyViewController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor grayColor];
    [self initNavigationItems];
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImageView *backImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoginScreen"]];
    backImgView.frame = CGRectMake(0, 20, 320, 100);
    [backImgView sizeToFit];
    [self.view addSubview:backImgView];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(10, 175, 300, 30)];
    [loginBtn setBackgroundImage:[UIImage reSizeableExtensionImage:@"RedButton"] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage reSizeableExtensionImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}

- (void)initNavigationItems{
    self.navigationItem.title = @"我的彩票";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClicked)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"FBMM_Barbutton"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarBtnClicked)];
}


- (void)rightBarBtnClicked{
        SettingViewController *settingVC = [[SettingViewController alloc]init];
        settingVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)leftBarBtnClicked{
    
}
@end
