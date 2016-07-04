//
//  MJViewController.m
//  09-核心动画05-CAAnimationGroup
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *myvie;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.创建旋转动画对象
    CABasicAnimation *rotate = [CABasicAnimation animation];
    rotate.keyPath = @"transform.rotation";
    rotate.toValue = @(M_PI);
    
    // 2.创建缩放动画对象
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(0.0);
    
    // 3.平移动画
    CABasicAnimation *move = [CABasicAnimation animation];
    move.keyPath = @"transform.translation";
    move.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    // 4.将所有的动画添加到动画组中
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, scale, move];
    group.duration = 2.0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.myvie.layer addAnimation:group forKey:nil];
}

@end
