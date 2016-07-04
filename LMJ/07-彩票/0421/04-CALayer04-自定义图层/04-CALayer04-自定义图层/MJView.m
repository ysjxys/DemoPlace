//
//  MJView.m
//  04-CALayer04-自定义图层
//
//  Created by apple on 14-4-21.
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
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    // 红色
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    // 添加圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 50));
    // 实心绘制
    CGContextFillPath(ctx);
}

@end
