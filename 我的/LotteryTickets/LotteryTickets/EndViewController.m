//
//  EndViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "EndViewController.h"

@implementation EndViewController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor greenColor];
    [self initNavigationItems];
}

- (void)initNavigationItems{
    self.navigationItem.title = @"开奖信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"pushSettings"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClicked)];
}


- (void)rightBarBtnClicked{
    //    InfomationViewController *infoVC = [[InfomationViewController alloc]init];
    //    infoVC.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:infoVC animated:YES];
}

@end
