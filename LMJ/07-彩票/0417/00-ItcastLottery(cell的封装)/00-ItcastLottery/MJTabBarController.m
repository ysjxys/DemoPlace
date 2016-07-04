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
    
    // 1.添加自己的tabbar
    MJTabBar *myTabBar = [[MJTabBar alloc] init];
    myTabBar.delegate = self;
    myTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    
    // 2.添加对应个数的按钮
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [myTabBar addTabButtonWithName:name selName:selName];
    }
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