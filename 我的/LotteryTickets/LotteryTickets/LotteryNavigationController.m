//
//  LotteryNavigationController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LotteryNavigationController.h"

@interface LotteryNavigationController()
@end
@implementation LotteryNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
}

+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSString *bgName = nil;
    if (IOS7) {
        bgName = @"NavBar64";
    }else{
        bgName = @"NavBar";
    }
    
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    navBar.tintColor = [UIColor whiteColor];
    
    NSMutableDictionary *navBarAttr = [NSMutableDictionary dictionary];
    navBarAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:navBarAttr];
    
    UIBarButtonItem *barBtnItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *barBtnAttr = [NSMutableDictionary dictionary];
    barBtnAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [barBtnItem setTitleTextAttributes:barBtnAttr forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    SJLOG(@"%@",viewController.title);
    if (![viewController.title isEqualToString:MAINCTL]) {
//        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
