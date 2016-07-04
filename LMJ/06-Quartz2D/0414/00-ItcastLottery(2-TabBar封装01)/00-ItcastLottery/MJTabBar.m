//
//  MJTabBar.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTabBar.h"
#import "MJTabBarButton.h"

#define MJTabBarButtonCount 5

@interface MJTabBar()
/**
 *  记录当前选中的按钮
 */
@property (nonatomic, weak) MJTabBarButton *selectedButton;
@end

@implementation MJTabBar

/**
 *  init方法内部会调用initWithFrame:方法
 *  UI控件:建议重写initWithFrame:方法来做一些初始化的操作
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButtons];
    }
    return self;
}

/**
 *  初始化按钮
 */
- (void)setupButtons
{
    for (int i = 0; i<MJTabBarButtonCount; i++) {
        // 创建按钮
        MJTabBarButton *button = [MJTabBarButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        // 设置图片
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        
        NSString *selectedName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
        
        // 添加
        [self addSubview:button];
        
#warning UIControlEventTouchDown : 手指一按下去就会触发这个事件
        // 监听
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        // 默认选中第0个位置的按钮(点击了这个按钮)
        if (i == 0) {
            [self buttonClick:button];
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i<MJTabBarButtonCount; i++) {
        MJTabBarButton *button = self.subviews[i];
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / MJTabBarButtonCount;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(MJTabBarButton *)button
{
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.新点击的按钮就成为了"当前选中的按钮"
    self.selectedButton = button;
}
@end