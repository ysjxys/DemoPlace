//
//  MJView.m
//  04-矩阵操作
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJView.h"

@implementation MJView

/**
 渐变色
 虚线
 pattern
 blend
 .....
 .....
 阴影
 */

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    CGContextSaveGState(ctx);
    
    CGContextRotateCTM(ctx, M_PI_4 * 0.3);
    CGContextScaleCTM(ctx, 0.5, 0.5);
    CGContextTranslateCTM(ctx, 0, 150);
    
    CGContextAddRect(ctx, CGRectMake(10, 10, 50, 50));
    
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 250);
    
    
    // 矩阵操作
//    CGContextScaleCTM(ctx, 0.5, 0.5);
    
    CGContextStrokePath(ctx);
}

@end
