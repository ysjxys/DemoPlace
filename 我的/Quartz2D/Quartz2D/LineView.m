//
//  LineView.m
//  Quartz2D
//
//  Created by ysj on 15/7/14.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LineView.h"

@implementation LineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 0);
    CGContextClosePath(ctx);
    
//    CGContextSetLineWidth(ctx, 10);
    
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
//    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    CGContextAddArc(ctx, 50, 50, 50, -M_PI_2, M_PI_2, 1);
    
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
}



@end
