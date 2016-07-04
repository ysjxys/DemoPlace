//
//  MJView.m
//  01-view的拖拽
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJView.h"

@implementation MJView

// 一个完整的触摸过程:touchesBegan -> touchesMoved -> touchesEnded

/**
 *  触摸开始(手指刚碰到view)
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    event.type
    
    // 随机取一个对象
//    UITouch *touch = [touches anyObject];

//    NSLog(@"touchesBegan--%d", touches.count);
    
//    NSLog(@"%d", touch.tapCount);
}

/**
 *  触摸ing(手指在view上面挪来挪去)
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // 当前触摸点
    CGPoint current = [touch locationInView:self];
    // 上一个触摸点
    CGPoint previous = [touch previousLocationInView:self];
    
    // 修改当前view的位置(中点)
    CGPoint center = self.center;
    center.x += current.x - previous.x;
    center.y += current.y - previous.y;
    self.center = center;
}

/**
 *  触摸结束(手指离开view)
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch = [touches anyObject];
//    NSLog(@"touchesEnded--%d", touches.count);
}


@end
