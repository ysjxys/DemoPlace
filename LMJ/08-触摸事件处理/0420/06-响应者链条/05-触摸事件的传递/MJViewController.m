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
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"MJViewController-----touchesBegan");
}

@end
