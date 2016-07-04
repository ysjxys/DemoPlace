//
//  ViewController.m
//  LockView
//
//  Created by ysj on 15/7/28.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "LockView.h"

@interface ViewController ()<LockViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageView.image = [UIImage imageNamed:@"Home_refresh_bg"];
    [self.view addSubview:backImageView];
    
    LockView *lock = [[LockView alloc]initWithFrame:CGRectMake(0, 100, 320, 400)];
    lock.delegate = self;
    [self.view addSubview:lock];
}

- (void)lockView:(LockView *)lockView didFinishedPath:(NSString *)path{
    NSLog(@"%@",path);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
