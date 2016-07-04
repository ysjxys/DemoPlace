//
//  MJLayer.m
//  04-CALayer04-自定义图层
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJLayer.h"

@implementation MJLayer

/**
 *  只有明显地调用setNeedsDisplay方法,才会调用drawInContext:方法进行绘制
 */
- (void)drawInContext:(CGContextRef)ctx
{
    // 红色
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    // 添加圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 50));
    // 实心绘制
    CGContextFillPath(ctx);
}

@end
