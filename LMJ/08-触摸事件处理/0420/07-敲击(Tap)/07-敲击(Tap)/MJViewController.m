//
//  MJViewController.m
//  07-敲击(Tap)
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
    
    [self testTap2];
}

- (void)testTap2
{
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView)];
    tap.delegate = self;
    [self.iconView addGestureRecognizer:tap];
}

#pragma mark - 代理方法
/**
 *  当点击view的时候,会先调用这个方法
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint pos = [touch locationInView:touch.view];
    if (pos.x <= self.iconView.frame.size.width * 0.5) {
        return YES;
    }
    return NO;
}

- (void)testTap
{
    // 1.创建手势识别器对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    // 连续敲击2次,手势才能识别成功
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 2;
    
    // 2.添加手势识别器对象到对应的view
    [self.iconView addGestureRecognizer:tap];
    
    // 3.添加监听方法(识别到了对应的手势,就会调用监听方法)
    [tap addTarget:self action:@selector(tapView)];
}

- (void)tapView
{
    NSLog(@"-----tapView");
}

@end
