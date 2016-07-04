//
//  MJViewController.m
//  10-UIView封装的动画
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *myview;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic, assign) int index;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.index++;
    if (self.index == 3) {
        self.index = 0;
    }
    
    NSString *filename = [NSString stringWithFormat:@"%d.jpg", self.index + 1];
    self.iconView.image = [UIImage imageNamed:filename];
    
    [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:nil completion:nil];
}

- (void)testViewSimpleAnim
{
    [UIView beginAnimations:nil context:nil];
    // 动画执行完毕后, 会自动调用self的animateStop方法
    //    [UIView setAnimationDelegate:self];
    //    [UIView setAnimationDidStopSelector:@selector(animateStop)];
    self.myview.center = CGPointMake(200, 300);
    [UIView commitAnimations];
    
    [UIView animateWithDuration:1.0 animations:^{
        self.myview.center = CGPointMake(200, 300);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)testLayerAnim
{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position";
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.duration = 2.0;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.delegate = self;
    
    // 图层动画都是假象, 在动画执行过程中, 图层的position属性一直都没有变过
    [self.myview.layer addAnimation:anim forKey:nil];
    
    //    self.myview.layer.position == CGPointMake(0, 0)
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@", NSStringFromCGPoint(self.myview.layer.position));
}

@end
