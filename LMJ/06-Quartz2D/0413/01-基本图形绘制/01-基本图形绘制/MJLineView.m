//
//  MJView.m
//  01-基本图形绘制
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJLineView.h"

@implementation MJLineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // 1.获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接图形(路径)
    // 设置线段宽度
    CGContextSetLineWidth(ctx, 10);
    
    // 设置线段头尾部的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 设置线段转折点的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    /**  第1根线段  **/
    // 设置颜色
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    // 设置一个起点
    CGContextMoveToPoint(ctx, 10, 10);
    // 添加一条线段到(100, 100)
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 渲染一次
    CGContextStrokePath(ctx);
    
    
    /**  第2根线段  **/
    // 设置颜色
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    // 设置一个起点
    CGContextMoveToPoint(ctx, 200, 190);
    // 添加一条线段到(150, 40)
    CGContextAddLineToPoint(ctx, 150, 40);
    CGContextAddLineToPoint(ctx, 120, 60);
    
    
    // 3.渲染显示到view上面
    CGContextStrokePath(ctx);
}

@end
