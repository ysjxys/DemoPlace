//
//  MJHumanView.m
//  02-小黄人
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#define MJRadius 70
#define MJTopY 100
#define MJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "MJHumanView.h"

@implementation MJHumanView

- (void)drawRect:(CGRect)rect
{
    // 1.上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.身体
    drawBody(ctx, rect);
    
    // 3.嘴(微笑)
    drawZui(ctx, rect);
    
    // 3.画眼睛
    drawEyes(ctx, rect);
}

/**
 *  眼睛
 */
void drawEyes(CGContextRef ctx, CGRect rect)
{
    // 1.黑色绑带
    CGFloat startX = rect.size.width * 0.5 - MJRadius;
    CGFloat startY = MJTopY;
    CGContextMoveToPoint(ctx, startX, startY);
    CGFloat endX = startX + 2 * MJRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(ctx, endX, endY);
    CGContextSetLineWidth(ctx, 15);
    [[UIColor blackColor] set];
    // 绘制线条
    CGContextStrokePath(ctx);
    
    // 2.最外圈的镜框
    [MJColor(61, 62, 66) set];
    CGFloat kuangRadius = MJRadius * 0.4;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width * 0.5 - kuangRadius;
    CGContextAddArc(ctx, kuangX, kuangY, kuangRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    // 3.里面的白色框
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius * 0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(ctx, whiteX, whiteY, whiteRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
}

/**
 *  画嘴
 */
void drawZui(CGContextRef ctx, CGRect rect)
{
    // 中间的控制点
    CGFloat controlX = rect.size.width * 0.5;
    CGFloat controlY = rect.size.height * 0.4;
    
    // 当前点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(ctx, currentX, currentY);
    
    // 结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    // 贝塞尔曲线
    CGContextAddQuadCurveToPoint(ctx, controlX, controlY, endX, endY);
    
    // 设置颜色
    [[UIColor blackColor] set];
    
    // 渲染
    CGContextStrokePath(ctx);
}

/**
 *  画身体
 */
void drawBody(CGContextRef ctx, CGRect rect)
{
    // 上半圆
    CGFloat topX = rect.size.width * 0.5;
    CGFloat topY = MJTopY;
    CGFloat topRadius = MJRadius;
    CGContextAddArc(ctx, topX, topY, topRadius, 0, M_PI, 1);
    
    // 向下延伸
    CGFloat middleX = topX - topRadius;
    CGFloat middleH = 100; // 中间身体的高度
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(ctx, middleX, middleY);
    
    // 下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    // 合并路径
    CGContextClosePath(ctx);
    
    // 设置颜色
    [MJColor(252, 218, 0) set];
    
    // 利用填充方式画出之前的路径
    CGContextFillPath(ctx);
}

@end
