//
//  MJViewController.m
//  05-核心动画01-CABasicAnimation
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MJViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(100, 100);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self testTranslate];
}

- (void)testTransform
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    //    anim.keyPath = @"transform.rotation";
    //    anim.keyPath = @"transform.scale.x";
    anim.keyPath = @"transform.translation.x";
    anim.toValue = @(100);
    //    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anim.duration = 2.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testRotate
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"transform";
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, -1, 0)];
    anim.duration = 2.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testScale
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"bounds";
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anim.duration = 2.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}


- (void)testTranslate
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"position";
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    // toValue : 最终变成什么值
    // byValue : 增加多少值
    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    anim.duration = 2.0;
    
    /**让图层保持动画执行完毕后的状态**/
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

@end
