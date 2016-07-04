//
//  BuyLotteryViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/15.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "BuyLotteryViewController.h"
#import "InfomationViewController.h"

@implementation BuyLotteryViewController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor redColor];
    [self initNavigationItems];
    
}

- (void)initNavigationItems{
    self.navigationItem.title = @"购彩大厅";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"zixunBarFlat"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClicked)];
}


- (void)rightBarBtnClicked{
    InfomationViewController *infoVC = [[InfomationViewController alloc]init];
    infoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:infoVC animated:YES];
}
@end
