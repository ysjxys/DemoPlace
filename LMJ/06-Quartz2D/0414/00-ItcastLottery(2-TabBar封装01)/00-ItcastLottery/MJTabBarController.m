//
//  MJTabBarController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTabBarController.h"
#import "MJTabBar.h"
#import "MJTabBarButton.h"

@interface MJTabBarController () <MJTabBarDelegate>
@end

@implementation MJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.移除系统自带的tabbar
    [self.tabBar removeFromSuperview];
    
    // 2.添加自己的tabbar
    MJTabBar *myTabBar = [[MJTabBar alloc] init];
    myTabBar.delegate = self;
    myTabBar.frame = self.tabBar.frame;
    myTabBar.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myTabBar];
}

/**
 normal : 普通状态
 highlighted : 高亮(用户长按的时候达到这个状态)
 disable : enabled = NO
 selected :  selected = YES
 */

#pragma mark - MJTabBar的代理方法
- (void)tabBar:(MJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    // 选中最新的控制器
    self.selectedIndex = to;
}
@end