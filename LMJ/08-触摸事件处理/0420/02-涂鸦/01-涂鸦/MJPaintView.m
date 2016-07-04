//
//  MJPaintView.m
//  01-涂鸦
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJPaintView.h"

@interface MJPaintView()
@property (nonatomic, strong) NSMutableArray *paths;
@end

@implementation MJPaintView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)clear
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

/**
 确定起点
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.获得当前的触摸点
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    
    // 2.创建一个新的路径
    UIBezierPath *currenPath = [UIBezierPath bezierPath];
    currenPath.lineCapStyle = kCGLineCapRound;
    currenPath.lineJoinStyle = kCGLineJoinRound;
    
    // 设置起点
    [currenPath moveToPoint:startPos];
    
    // 3.添加路径到数组中
    [self.paths addObject:currenPath];
    
    [self setNeedsDisplay];
}

/**
 连线
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = [self.paths lastObject];
    [currentPath addLineToPoint:pos];
    
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
    [[UIColor redColor] set];
    
    for (UIBezierPath *path in self.paths) {
        path.lineWidth = 10;
        [path stroke];
    }
}

- (void)testPath
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextMoveToPoint(ctx, 0, 0);
    //    CGContextAddLineToPoint(ctx, 100, 100);
    //    CGContextStrokePath(ctx);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    CGContextAddPath(ctx, path);
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, NULL, 250, 250);
    CGPathAddLineToPoint(path2, NULL, 110, 100);
    CGContextAddPath(ctx, path2);
    
    
    CGContextStrokePath(ctx);
    
    CGPathRelease(path);
}

@end
