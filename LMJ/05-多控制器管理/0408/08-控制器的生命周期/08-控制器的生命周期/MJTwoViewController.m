//
//  MJTwoViewController.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTwoViewController.h"

@interface MJTwoViewController ()

@end

@implementation MJTwoViewController
/**
 *  view加载完毕
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"MJTwoViewController-viewDidLoad");
}

/**
 *  view即将显示到window上
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"MJTwoViewController-viewWillAppear");
}

/**
 *  view显示完毕(已经显示到窗口)
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"MJTwoViewController-viewDidAppear");
}

/**
 *  view即将从window上移除(即将看不见)
 *
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"MJTwoViewController-viewWillDisappear");
}

/**
 *  view从window上完全移除(完全看不见)
 *
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"MJTwoViewController-viewDidDisappear");
}
@end
