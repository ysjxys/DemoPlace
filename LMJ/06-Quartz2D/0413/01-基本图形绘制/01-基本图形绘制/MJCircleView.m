//
//  MJCircleView.m
//  01-基本图形绘制
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJCircleView.h"

@implementation MJCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
 *  在view第一次显示到屏幕上的时候会调用一次
 */
- (void)drawRect:(CGRect)rect
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画1/4圆
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 150);
    CGContextAddArc(ctx, 100, 100, 50, -M_PI_2, M_PI, 1);
    CGContextClosePath(ctx);
    
    [[UIColor redColor] set];
    
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
}

/**
 *  画圆弧
 */
void drawArc()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画圆弧
    // x\y : 圆心
    // radius : 半径
    // startAngle : 开始角度
    // endAngle : 结束角度
    // clockwise : 圆弧的伸展方向(0:顺时针, 1:逆时针)
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    
    
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
}

/**
 *  画圆
 */
void drawCircle()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 10, 100, 100));
    
    CGContextSetLineWidth(ctx, 10);
    
    // 3.显示所绘制的东西
    CGContextStrokePath(ctx);
}

@end
