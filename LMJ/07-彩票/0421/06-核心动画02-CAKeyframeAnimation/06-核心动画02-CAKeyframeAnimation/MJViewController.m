//
//  MJViewController.m
//  06-核心动画02-CAKeyframeAnimation
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 2.0;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 200, 200));
    anim.path = path;
    CGPathRelease(path);
    
    // 设置动画的执行节奏
    // kCAMediaTimingFunctionEaseInEaseOut : 一开始比较慢, 中间会加速,  临近结束的时候, 会变慢
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    
    [self.redView.layer addAnimation:anim forKey:nil];
}

#pragma mark - 动画的代理方法
#pragma mark 动画开始的时候调用
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}
#pragma mark 动画结束的时候调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}

- (void)testMove
{
    //    CABasicAnimation  fromValue --> toValue
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointZero];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    anim.values = @[v1, v2, v3, v4];
    
    //    anim.keyTimes = @[@(0.5), @(0.25), @(0.25)];
    
    anim.duration = 2.0;
    
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:anim forKey:nil];
}

@end
