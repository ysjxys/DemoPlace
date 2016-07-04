//
//  MJView.m
//  01-复习
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJView.h"

@implementation MJView

// Create\copy\retain ---> release
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 1.先创建一个路径
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    
    
    // 2.拼接路径
    CGPathMoveToPoint(linePath, NULL, 0, 0);
    CGPathAddLineToPoint(linePath, NULL, 100, 100);
    
    // 3.添加路径到上下文
    CGContextAddPath(ctx, linePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddArc(circlePath, NULL, 150, 150, 50, 0, M_PI * 2, 0);
    CGContextAddPath(ctx, circlePath);
    
    // 4.渲染
    CGContextStrokePath(ctx);
    
    
    CGPathRelease(linePath);
    CGPathRelease(circlePath);
    
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRelease(cs);
    
//    CFRelease(linePath);
//    CFRelease(circlePath);
//    CFRelease(cs);
}

void draw4Rect()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.画矩形
    // 2.1.4个点
    //    CGContextMoveToPoint(ctx, 0, 0);
    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
    //    CGContextClosePath(<#CGContextRef c#>);
    
    // 2.2.直线
    //    CGContextMoveToPoint(ctx, 0, 0);
    //    CGContextAddLineToPoint(<#CGContextRef c#>, <#CGFloat x#>, <#CGFloat y#>);
    //    CGContextSetLineWidth(<#CGContextRef c#>, <#CGFloat width#>)
    
    // 2.3.直接画
    //    CGContextAddRect(ctx, CGRectMake(100, 100, 100, 100));
    //    CGContextFillPath(ctx);
    
    // 2.4.通过UIkit 的OC方法
    //    UIRectFill(CGRectMake(0, 0, 100, 100));
    
    // 2.5.
    CGContextStrokeRect(ctx, CGRectMake(100, 100, 100, 100));
}

@end
