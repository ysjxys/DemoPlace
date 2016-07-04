//
//  MJShapeView.m
//  01-基本图形绘制
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJShapeView.h"

@implementation MJShapeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    draw4Rect();
}

/**
 *  画四边形
 */
void draw4Rect()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画矩形
    CGContextAddRect(ctx, CGRectMake(10, 10, 150, 100));
    
    // set : 同时设置为实心和空心颜色
    // setStroke : 设置空心颜色
    // setFill : 设置实心颜色
    [[UIColor whiteColor] set];
    
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    // 3.绘制图形
    CGContextFillPath(ctx);
}

/**
 *  画三角形
 */
void drawTriangle()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画三角形
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 80);
    // 关闭路径(连接起点和最后一个点)
    CGContextClosePath(ctx);
    
    //
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    // 3.绘制图形
    CGContextStrokePath(ctx);
}

@end
