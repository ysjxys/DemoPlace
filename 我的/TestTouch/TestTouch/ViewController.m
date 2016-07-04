//
//  ViewController.m
//  TestTouch
//
//  Created by ysj on 15/7/29.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImageView];
    [self testTap];//点击
//    [self testLongPress];//长按
//    [self testSwipe];//轻滑动
//    [self testPinch];//捏合
//    [self testRotate];//旋转
//    [self testPan];//拖动
}

#pragma mark - 拖动
- (void)testPan{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPan:)];
    [self.imageView addGestureRecognizer:panGesture];
}

- (void)didPan:(UIPanGestureRecognizer *)panGesture{
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"begin");
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"end");
            break;
            
        default:
            break;
    }
    
    CGPoint center = panGesture.view.center;
    CGPoint move = [panGesture translationInView:panGesture.view];
    center.x = move.x + center.x;
    center.y = move.y + center.y;
    panGesture.view.center = center;
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}


#pragma mark - 旋转
- (void)testRotate{
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(didRotate:)];
    [self.imageView addGestureRecognizer:rotateGesture];
}

- (void)didRotate:(UIRotationGestureRecognizer *)rotateGesture{
    rotateGesture.view.transform = CGAffineTransformRotate(rotateGesture.view.transform, rotateGesture.rotation);
    rotateGesture.rotation = 0;
}

#pragma mark - 捏合
- (void)testPinch{
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(didPinch:)];
    [self.imageView addGestureRecognizer:pinchGesture];
}

- (void)didPinch:(UIPinchGestureRecognizer *)pinchGesture{
    pinchGesture.view.transform = CGAffineTransformScale(pinchGesture.view.transform, pinchGesture.scale, pinchGesture.scale);
    pinchGesture.scale = 1;
}

#pragma mark - 滑动
- (void)testSwipe{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(theResult)];
    //设置往上滑动触发
    swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.imageView addGestureRecognizer:swipeGesture];
}
 
#pragma mark - 长按
- (void)testLongPress{
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(theResult)];
    // 至少长按2秒
    longPressGesture.minimumPressDuration = 2;
    // 在触发手势之前,50px范围内长按有效
    longPressGesture.allowableMovement = 50;
    [self.imageView addGestureRecognizer:longPressGesture];
}

#pragma mark - 点击
- (void)testTap{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(theResult)];
//    tapGesture.delegate = self;
    [self.imageView addGestureRecognizer:tapGesture];
}

#pragma mark - 代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint point = [touch locationInView:touch.view];
    if (point.x > 160) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark - 其他方法
- (void)theResult{
    NSLog(@"xx");
}

- (void)initImageView{
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minion"]];
    image.frame = CGRectMake(40, 150, 240, 160);
    image.userInteractionEnabled = YES;
    self.imageView = image;
    [self.view addSubview:image];
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
