//
//  MJViewController.m
//  01-CALayer01-基本使用
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *purpleView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testView];
}

- (void)testImageView2
{
    self.iconView.layer.transform = CATransform3DMakeScale(1.5, 0.5, 0);
    self.iconView.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    [self.iconView.layer setValue:value forKeyPath:@"transform"];

    [self.iconView.layer setValue:@(M_PI_2) forKeyPath:@"transform.rotation"];
    
    
    self.iconView.layer.transform = CATransform3DMakeScale(0.5, 2, 0);
   [self.iconView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 2, 0)] forKeyPath:@"transform"];
    
    // 可以传递哪些key path, 在官方文档搜索 "CATransform3D key paths"
    [self.iconView.layer setValue:@(-100) forKeyPath:@"transform.translation.x"];
}

- (void)testImageView
{
    // 边框宽度
//    self.iconView.layer.borderWidth = 10;
//    // 边框颜色
//    self.iconView.layer.borderColor = [UIColor greenColor].CGColor;
    // 圆角
    self.iconView.layer.cornerRadius = 10;

    // 超出主层边框范围的内容都剪掉
    self.iconView.layer.masksToBounds = YES;
    
    // 阴影颜色
    self.iconView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 阴影偏差
    self.iconView.layer.shadowOffset = CGSizeMake(20, 20);
    // 阴影不透明度
    self.iconView.layer.shadowOpacity = 0.5;
}

- (void)testView
{
    // 边框宽度
    self.purpleView.layer.borderWidth = 10;
    //    // 边框颜色
    self.purpleView.layer.borderColor = [UIColor greenColor].CGColor;
    // 圆角
    self.purpleView.layer.cornerRadius = 10;
    
    //    self.purpleView.layer.masksToBounds = YES;
    // 阴影颜色
    self.purpleView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 阴影偏差
    self.purpleView.layer.shadowOffset = CGSizeMake(20, 20);
    // 阴影不透明度
    self.purpleView.layer.shadowOpacity = 0.5;
}

@end
