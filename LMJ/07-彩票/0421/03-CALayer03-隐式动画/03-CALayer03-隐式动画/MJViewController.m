//
//  MJViewController.m
//  03-CALayer03-隐式动画
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = CGPointZero;
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    self.layer.backgroundColor = [UIColor blueColor].CGColor;
//    [CATransaction begin]; // 开启事务
//    [CATransaction setDisableActions:YES];
    
//    self.layer.position = CGPointMake(100, 100);
    self.layer.opacity = 0.5;
    
//    [CATransaction commit]; // 提交事务
}

@end
