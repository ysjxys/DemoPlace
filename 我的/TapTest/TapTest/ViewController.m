//
//  ViewController.m
//  TapTest
//
//  Created by ysj on 15/9/24.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *swipeView;
@property (nonatomic, assign) BOOL isHidden;
@property (nonatomic ,assign) CGPoint startPoint;
@property (nonatomic ,assign) CGPoint endPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    self.startPoint = CGPointMake(280, 100);
    self.endPoint = CGPointMake(35, 100);
    UIView *swipeView = [[UIView alloc]initWithFrame:CGRectMake(280, 100, 250, 280)];
    swipeView.backgroundColor = [UIColor purpleColor];
    swipeView.userInteractionEnabled = YES;
    [self.view addSubview:swipeView];
    self.swipeView = swipeView;
    
    self.isHidden = YES;
    
    UIPanGestureRecognizer *tapREG = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.swipeView addGestureRecognizer:tapREG];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer{
    CGPoint move = [recognizer translationInView:recognizer.view];
    CGPoint center = recognizer.view.center;
    center.x = center.x + move.x;
    NSLog(@"%f",move.x);
    if (center.x - 125 < self.startPoint.x && center.x - 125 > self.endPoint.x) {
        recognizer.view.center = center;
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
    }
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"start");
            break;
        case UIGestureRecognizerStateEnded:{
            NSLog(@"end");
            [UIView animateWithDuration:0.3 animations:^{
                if (self.isHidden) {
                    if (center.x - 125 < self.startPoint.x - 50) {
                        recognizer.view.center = CGPointMake(self.endPoint.x + 125, self.endPoint.y + 140);
                        self.isHidden = NO;
                    }else{
                        recognizer.view.center = CGPointMake(self.startPoint.x + 125, self.startPoint.y + 140);
                        self.isHidden = YES;
                    }
                }else{
                    if (center.x - 125 > self.endPoint.x + 50) {
                        recognizer.view.center = CGPointMake(self.startPoint.x + 125, self.startPoint.y + 140);
                        self.isHidden = YES;
                    }else{
                        recognizer.view.center = CGPointMake(self.endPoint.x + 125, self.endPoint.y + 140);
                        self.isHidden = NO;
                    }
                }
            }];
        }
            break;
        default:
            
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
