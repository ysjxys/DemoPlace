//
//  MJViewController.m
//  04-CALayer04-自定义图层
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJLayer.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self diyLayer2];
    
// UIView *view;
    
// view.layer.delegate == view;
    
// view的完整显示过程
// 1. view.layer会准备一个Layer Graphics Contex(图层类型的上下文)
// 2. 调用view.layer.delegate(view)的drawLayer:inContext:,并传入刚才准备好的上下文
// 3. view的drawLayer:inContext:方法内部又会调用view的drawRect:方法
// 4. view就可以在drawRect:方法中实现绘图代码, 所有东西最终都绘制到view.layer上面
// 5. 系统再将view.layer的内容拷贝到屏幕, 于是完成了view的显示
}

- (void)diyLayer2
{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.anchorPoint = CGPointZero;
    layer.position = CGPointMake(100, 100);
    layer.delegate = self;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}

#pragma mark - 图层的代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextAddRect(ctx, CGRectMake(0, 0, 20, 20));
    CGContextFillPath(ctx);
}

- (void)diyLayer
{
    MJLayer *layer = [MJLayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.anchorPoint = CGPointZero;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
