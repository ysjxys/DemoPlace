//
//  MJViewController.m
//  03-按钮的基本使用
//
//  Created by apple on 14-3-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)up;
- (IBAction)down;
- (IBAction)left;
- (IBAction)right;

- (IBAction)big;
- (IBAction)small;

// 头像
@property (nonatomic, weak) IBOutlet UIButton *head;
@end

@implementation MJViewController

#pragma mark 向上走
- (IBAction)up
{
    // 不允许直接修改  对象 的 结构体属性 的成员
    
    // 允许直接 对象 的 结构体 属性
    
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.y -= 10;
    self.head.frame = tempFrame;
}

#pragma mark 向下走
- (IBAction)down
{
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.y += 10;
    self.head.frame = tempFrame;
}

#pragma mark 向左走
- (IBAction)left
{
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.x -= 10;
    self.head.frame = tempFrame;
}

#pragma mark 向右走
- (IBAction)right
{
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.x += 10;
    self.head.frame = tempFrame;
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
