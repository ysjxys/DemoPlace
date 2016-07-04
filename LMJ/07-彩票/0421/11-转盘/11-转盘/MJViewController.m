//
//  MJViewController.m
//  11-转盘
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJWheel.h"

@interface MJViewController ()
- (IBAction)start;
- (IBAction)stop;
@property (nonatomic, weak) MJWheel *wheel;
@end

@implementation MJViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MJWheel *wheel = [MJWheel wheel];
    wheel.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    [self.view addSubview:wheel];
    self.wheel = wheel;
}

- (IBAction)start {
    [self.wheel startRotating];
}

- (IBAction)stop {
    [self.wheel stopRotating];
}
@end
