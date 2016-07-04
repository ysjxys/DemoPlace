//
//  MJView.m
//  06-重绘(刷帧)
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJView.h"

@implementation MJView

- (void)setRadius:(float)radius
{
    _radius = radius;
    
    [self setNeedsDisplay];
}

/**
 *  默认只会在view第一次显示的时候调用(只能由系统自动调用, 不能手动调用)
 */
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drwract---%f", self.radius);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, 125, 125, self.radius, 0, M_PI * 2, 0);
    
    CGContextFillPath(ctx);
}

@end
