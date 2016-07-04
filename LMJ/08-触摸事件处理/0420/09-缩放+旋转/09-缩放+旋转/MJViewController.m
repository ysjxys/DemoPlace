//
//  MJViewController.m
//  09-缩放+旋转
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testPinchAndRotate];
}

#pragma mark - 手势识别器的代理方法

/**
 *  是否允许多个手势识别器同时有效
 *  Simultaneously : 同时地
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

#pragma mark - 缩放 + 旋转
- (void)testPinchAndRotate
{
    [self testPinch];
    [self testRotate];
}

#pragma mark - 缩放手势(捏合手势)
- (void)testPinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    pinch.delegate = self;
    [self.iconView addGestureRecognizer:pinch];
}

- (void)pinchView:(UIPinchGestureRecognizer *)pinch
{
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1; // 这个真的很重要!!!!!
}

#pragma mark - 旋转手势
- (void)testRotate
{
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    recognizer.delegate = self;
    [self.iconView addGestureRecognizer:recognizer];
}

- (void)rotateView:(UIRotationGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0; // 这个很重要!!!!!
}

@end
