//
//  MJViewController.m
//  03-按钮的基本使用
//
//  Created by apple on 14-3-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)move:(UIButton *)btn;

- (IBAction)big;
- (IBAction)small;

// 头像
@property (nonatomic, weak) IBOutlet UIButton *head;
@end

@implementation MJViewController

#pragma mark 移动(上下左右)
- (IBAction)move:(UIButton *)btn
{
    // center (x=200, y=10)
    // center (x=200, y=210)
    
    // 0.开始动画
    [UIView beginAnimations:nil context:nil];
    
    // 动画持续2秒
    [UIView setAnimationDuration:2.0];
    
    // 1.取出原来的属性
    CGPoint tempCenter = self.head.center;
    
    // 2.修改临时属性
    CGFloat delta = 200;
    switch (btn.tag) {
        case 10: // 上
            tempCenter.y -= delta;
            break;
            
        case 20: // 下
            tempCenter.y += delta;
            break;
            
        case 30: // 左
            tempCenter.x -= delta;
            break;
            
        case 40: // 右
            tempCenter.x += delta;
            break;
    }
    
    // 3.重新赋值
    self.head.center = tempCenter;
    
    // 4.提交动画
    [UIView commitAnimations];
}

#pragma mark 放大
- (IBAction)big;
{
    // 0.开始动画
    [UIView beginAnimations:nil context:nil];
    
    // 动画持续2秒
    [UIView setAnimationDuration:2.0];
    
    // 1.取出原来的属性
    CGRect tempBounds = self.head.bounds;
    
    // 2.改变临时属性
    tempBounds.size.width += 50;
    tempBounds.size.height += 50;
    
    // 3.用临时属性覆盖原来的属性
    self.head.bounds = tempBounds;
    
    // 4.提交动画
    [UIView commitAnimations];
}

#pragma mark 缩小
- (IBAction)small
{
    // 1.取出原来的属性
    CGRect tempBounds = self.head.bounds;
    
    // 2.改变临时属性
    tempBounds.size.width -= 20;
    tempBounds.size.height -= 20;
    
    // 3.用临时属性覆盖原来的属性
    self.head.bounds = tempBounds;
}

@end
