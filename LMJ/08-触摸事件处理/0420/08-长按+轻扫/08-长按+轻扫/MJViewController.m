//
//  MJViewController.m
//  08-长按+轻扫
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeView)];
    
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.redView addGestureRecognizer:swipe];
}

- (void)swipeView
{
    NSLog(@"swipeView");
}

- (void)testLongPress
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] init];
    [longPress addTarget:self action:@selector(longPressView)];
    
    // 至少长按2秒
    longPress.minimumPressDuration = 2;
    
    // 在触发手势之前,50px范围内长按有效
    longPress.allowableMovement = 50;
    
    [self.redView addGestureRecognizer:longPress];
}

- (void)longPressView
{
    NSLog(@"长按了红色的view");
}

@end
