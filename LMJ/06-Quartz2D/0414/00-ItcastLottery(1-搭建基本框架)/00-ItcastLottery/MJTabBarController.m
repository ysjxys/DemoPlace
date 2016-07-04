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

@interface MJTabBarController ()
/**
 *  记录当前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedButton;
@end

@implementation MJTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.移除系统自带的tabbar
    [self.tabBar removeFromSuperview];
    
    // 2.添加自己的tabbar
    UIView *myTabBar = [[UIView alloc] init];
    myTabBar.frame = self.tabBar.frame;
    myTabBar.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myTabBar];
    
    // 3.添加5个按钮
    for (int i = 0; i<5; i++) {
        // 创建按钮
        MJTabBarButton *button = [MJTabBarButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        // 设置图片
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        NSString *selectedName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = myTabBar.frame.size.width * 0.2;
        CGFloat buttonH = myTabBar.frame.size.height;
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 添加
        [myTabBar addSubview:button];
        
#warning UIControlEventTouchDown : 手指一按下去就会触发这个事件
        // 监听
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        // 默认选中第0个位置的按钮(点击了这个按钮)
        if (i == 0) {
            [self buttonClick:button];
        }
    }
}

/**
 normal : 普通状态
 highlighted : 高亮(用户长按的时候达到这个状态)
 disable : enabled = NO
 selected :  selected = YES
 */

/**
 *  监听按钮点击
 */
- (void)buttonClick:(UIButton *)button
{
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.新点击的按钮就成为了"当前选中的按钮"
    self.selectedButton = button;
    
    // 4.切换子控制器
    self.selectedIndex = button.tag;
}

@end
