//
//  ViewController.m
//  CoreAnimation
//
//  Created by ysj on 15/7/31.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer addSublayer:self.layer];
//    [self initView];
//    [self next];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self testTransform];
//    [self testScale];
//    [self testRotate];
//    [self testTranslate];
//    
//    [self testMoveRect];
//    [self testMoveRound];
    
    [self testGroup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - CABasicAnimation

- (void)testTransform{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.translation.x";
    animation.toValue = @(200);
    [self.layer addAnimation:animation forKey:nil];
}

- (void)testScale{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"bounds";
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;//
    [self.layer addAnimation:animation forKey:nil];
}

- (void)testRotate{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 1, -1, 0)];
    [self.layer addAnimation:animation forKey:nil];
}

- (void)testTranslate{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark - CAKeyframeAnimation

- (void)testMoveRect{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.duration = 2.0;
    animation.keyPath = @"position";
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
    animation.values = @[value1,value2,value3,value4];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)testMoveRound{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.duration = 2.0;
    animation.keyPath = @"position";
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, nil, CGRectMake(50, 50, 150, 150));
    animation.path = path;
    CGPathRelease(path);
    
    [self.layer addAnimation:animation forKey:nil];
}

#pragma mark - 初始化方法
- (CALayer *)layer{
    if (!_layer) {
        CALayer *layer = [CALayer layer];
        layer.bounds = CGRectMake(0, 0, 100, 100);
        layer.position = CGPointMake(100, 100);
        layer.backgroundColor = [UIColor purpleColor].CGColor;
        _layer = layer;
    }
    return _layer;
}

#pragma mark - CATransition
- (void)initView{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 220, 200)];
    [self.view addSubview:imageView];
    self.imageView = imageView;
//    imageView.backgroundColor = [UIColor redColor];
    
    UIButton *btnNext = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnNext setTitle:@"下一张" forState:UIControlStateNormal];
    btnNext.frame = CGRectMake(200, 400, 50, 30);
    [btnNext addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
    
    UIButton *btnLast = [UIButton buttonWithType:UIButtonTypeSystem];
    [btnLast setTitle:@"上一张" forState:UIControlStateNormal];
    btnLast.frame = CGRectMake(50, 400, 50, 30);
    [btnLast addTarget:self action:@selector(last) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLast];
}

- (void)next{
    if (self.index == 7) {
        self.index = 1;
    }else{
        self.index++;
    }
    
    CATransition *transition = [CATransition animation];
    transition.type = @"pageCurl";
    transition.duration = 0.5;
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
}

- (void)last{
    if (self.index == 1) {
        self.index = 7;
    }else{
        self.index--;
    }
    
    CATransition *transition = [CATransition animation];
    transition.type = @"pageuUnCurl";
    transition.duration = 0.5;
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",self.index]];
}

#pragma mark - CAAnimationGroup

- (void)testGroup{
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
    
    [self.layer addAnimation:group forKey:nil];
}
@end
