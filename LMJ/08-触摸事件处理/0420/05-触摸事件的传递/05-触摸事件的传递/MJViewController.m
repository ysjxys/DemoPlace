//
//  MJViewController.m
//  05-触摸事件的传递
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    imageView.image = [UIImage imageNamed:@"minion"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = CGPointMake(100, 100);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:btn];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 200, 200);
//    btn.userInteractionEnabled = NO;
//    [btn setBackgroundImage:[UIImage imageNamed:@"minion"] forState:UIControlStateNormal];
//    [self.view addSubview:btn];
    
//    NSLog(@"%d", imageView.userInteractionEnabled);
}

- (void)click
{
    NSLog(@"click------");
}

@end
