//
//  MJViewController.m
//  03-按钮的基本使用
//
//  Created by apple on 14-3-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)moveAndBig;

- (IBAction)move:(UIButton *)btn;

- (IBAction)big;
- (IBAction)small;

// 头像
@property (nonatomic, weak) IBOutlet UIButton *head;
@end

@implementation MJViewController

- (IBAction)moveAndBig
{
    // 1.开启动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    
    // 2.修改属性
    CGRect tempF = self.head.frame;
    tempF.origin.x += 50;
    tempF.origin.y += 100;
    
    tempF.size.width += 50;
    tempF.size.height += 50;
    self.head.frame = tempF;
    
    // 3.提交动画
    [UIView commitAnimations];
}

#pragma mark 移动(上下左右)
- (IBAction)move:(UIButton *)btn
{
    // 1.取出原来的属性
    CGRect tempF = self.head.frame;
    
    // 2.修改临时属性
    CGFloat delta = 10;
    switch (btn.tag) {
        case 10: // 上
            tempF.origin.y -= delta;
            break;
            
        case 20: // 下
            tempF.origin.y += delta;
            break;
            
        case 30: // 左
            tempF.origin.x -= delta;
            break;
            
        case 40: // 右
            tempF.origin.x += delta;
            break;
    }
    
    // 3.重新赋值
    self.head.frame = tempF;
}

#pragma mark 放大
- (IBAction)big;
{
    // 1.取出原来的属性
    CGRect tempFrame = self.head.frame;
    
    // 2.改变临时属性
    tempFrame.size.width += 20;
    tempFrame.size.height += 20;
    
    // 3.用临时属性覆盖原来的属性
    self.head.frame = tempFrame;
}

#pragma mark 缩小
- (IBAction)small
{
    // 1.取出原来的属性
    CGRect tempFrame = self.head.frame;
    
    // 2.改变临时属性
    tempFrame.size.width -= 20;
    tempFrame.size.height -= 20;
    
    // 3.用临时属性覆盖原来的属性
    self.head.frame = tempFrame;
}

@end
