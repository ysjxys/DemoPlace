//
//  LotteryTabBar.m
//  LotteryTickets
//
//  Created by ysj on 15/7/15.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LotteryTabBar.h"
#import "LotteryTabBarButton.h"
@interface LotteryTabBar()
@property (nonatomic, strong) LotteryTabBarButton *selectedBtn;
@end

@implementation LotteryTabBar

- (void)addBtnToTabBarWithImgName:(NSString *)imgName SelImgName:(NSString *)selImgName{
    LotteryTabBarButton *btn = [LotteryTabBarButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selImgName] forState:UIControlStateSelected];
    [btn setBackgroundImage:[UIImage imageNamed:selImgName] forState:UIControlStateHighlighted];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    if (self.subviews.count == 1) {
        [self btnClicked:btn];
    }
}


- (void)btnClicked:(LotteryTabBarButton *)selectedBtn{
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBar:didSelectedFromTag:to:)]) {
        [self.tabBarDelegate tabBar:self didSelectedFromTag:(int)self.selectedBtn.tag to:(int)selectedBtn.tag];
        self.selectedBtn.selected = NO;
        self.selectedBtn = selectedBtn;
        self.selectedBtn.selected = YES;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        LotteryTabBarButton *btn = self.subviews[i];
        btn.tag = i;
        
        CGFloat width = self.frame.size.width / count;
        CGFloat height = self.frame.size.height;
        CGFloat y = 0;
        CGFloat x = width * i;
        btn.frame  = CGRectMake(x, y, width, height);
    }
}
@end
