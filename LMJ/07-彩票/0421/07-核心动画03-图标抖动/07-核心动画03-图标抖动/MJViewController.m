//
//  MJViewController.m
//  07-核心动画03-图标抖动
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
- (IBAction)start;
- (IBAction)stop;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (IBAction)start {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(Angle2Radian(-5)),  @(Angle2Radian(5)), @(Angle2Radian(-5))];
    anim.duration = 0.25;
    // 动画的重复执行次数
    anim.repeatCount = MAXFLOAT;
    
    // 保持动画执行完毕后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.iconView.layer addAnimation:anim forKey:@"shake"];
}

- (IBAction)stop {
    [self.iconView.layer removeAnimationForKey:@"shake"];
}
@end
