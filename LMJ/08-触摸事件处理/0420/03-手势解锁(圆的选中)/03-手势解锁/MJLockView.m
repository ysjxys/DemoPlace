//
//  MJLockView.m
//  03-手势解锁
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJLockView.h"

@implementation MJLockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

/**
 初始化
 */
- (void)setup
{
    for (int index = 0; index<9; index++) {
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.userInteractionEnabled = NO;
        
        btn.backgroundColor = [UIColor blueColor];
        
        // 设置默认的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        // 设置选中时的背景图片(selected)
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        // 添加按钮
        [self addSubview:btn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int index = 0; index<self.subviews.count; index++) {
        // 取出按钮
        UIButton *btn = self.subviews[index];
        
        // 设置frame
        CGFloat btnW = 74;
        CGFloat btnH = 74;
        
        int totalColumns = 3;
        int col = index % totalColumns;
        int row = index / totalColumns;
        CGFloat marginX = (self.frame.size.width - totalColumns * btnW) / (totalColumns + 1);
        CGFloat marginY = marginX;
        
        CGFloat btnX = marginX + col * (btnW + marginX);
        CGFloat btnY = row * (btnH + marginY);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:touch.view];
    
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            btn.selected = YES;
        }
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:touch.view];
    
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            btn.selected = YES;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect
{
    
}

@end
