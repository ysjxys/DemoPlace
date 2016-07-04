//
//  MJPaintView.m
//  01-涂鸦
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJPaintView.h"

@interface MJPaintView()
@property (nonatomic, strong) NSMutableArray *totalPathPoints;
@end

@implementation MJPaintView

- (NSMutableArray *)totalPathPoints
{
    if (_totalPathPoints == nil) {
        _totalPathPoints = [NSMutableArray array];
    }
    return _totalPathPoints;
}

- (void)clear
{
    [self.totalPathPoints removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back
{
    [self.totalPathPoints removeLastObject];
    [self setNeedsDisplay];
}

/**
 确定起点
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    
    // 每一次开始触摸, 就新建一个数组来存放这次触摸过程的所有点(这次触摸过程的路径)
    NSMutableArray *pathPoints = [NSMutableArray array];
    [pathPoints addObject:[NSValue valueWithCGPoint:startPos]];
    
    // 添加这次路径的所有点到大数组中
    [self.totalPathPoints addObject:pathPoints];
    
    [self setNeedsDisplay];
}

/**
 连线
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:touch.view];
    
    // 取出这次路径对应的数组
    NSMutableArray *pathPoints = [self.totalPathPoints lastObject];
    [pathPoints addObject:[NSValue valueWithCGPoint:pos]];
    
    [self setNeedsDisplay];
}

/**
 连线
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (NSMutableArray *pathPoints in self.totalPathPoints) {
        for (int i = 0; i<pathPoints.count; i++) { // 一条路径
            CGPoint pos = [pathPoints[i] CGPointValue];
            if (i == 0) {
                CGContextMoveToPoint(ctx, pos.x, pos.y);
            } else {
                CGContextAddLineToPoint(ctx, pos.x, pos.y);
            }
        }
    }
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetLineWidth(ctx, 5);
    CGContextStrokePath(ctx);
}

@end
