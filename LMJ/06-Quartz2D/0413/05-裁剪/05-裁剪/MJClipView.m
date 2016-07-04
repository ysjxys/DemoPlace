//
//  MJClipView.m
//  05-裁剪
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJClipView.h"

@implementation MJClipView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    // 0.画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
    // 裁剪
    CGContextClip(ctx);
    CGContextFillPath(ctx);
    
    // 1.显示图片
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawAtPoint:CGPointMake(100, 100)];
    
    CGContextRestoreGState(ctx);
    
    CGContextAddRect(ctx, CGRectMake(0, 0, 50, 50));
    CGContextFillPath(ctx);
}

@end
