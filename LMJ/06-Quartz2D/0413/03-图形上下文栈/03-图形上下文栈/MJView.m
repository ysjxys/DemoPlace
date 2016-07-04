//
//  MJView.m
//  03-图形上下文栈
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJView.h"

@implementation MJView

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
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 将ctx拷贝一份放到栈中
    CGContextSaveGState(ctx);
    
    // 设置绘图状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 第1根线
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 120, 190);
    
    CGContextStrokePath(ctx);
    
    // 将栈顶的上下文出栈,替换当前的上下文
    CGContextRestoreGState(ctx);
    
    
    // 第2根线
    CGContextMoveToPoint(ctx, 10, 70);
    CGContextAddLineToPoint(ctx, 220, 290);
    
    CGContextStrokePath(ctx);
//    CGContextDrawPath(ctx, kCGPathStroke);
}

@end
