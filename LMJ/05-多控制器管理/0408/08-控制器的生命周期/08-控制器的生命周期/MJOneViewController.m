//
//  MJOneViewController.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJOneViewController.h"

@interface MJOneViewController ()
@property (nonatomic, strong) NSArray *apps;
@property (nonatomic, strong) NSArray *persons;
@end

@implementation MJOneViewController

/***
 
 
 */

/**
 *  view加载完毕
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"MJOneViewController-viewDidLoad");
}

/**
 *  view即将显示到window上
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"MJOneViewController-viewWillAppear");
}

/**
 *  view显示完毕(已经显示到窗口)
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"MJOneViewController-viewDidAppear");
}

/**
 *  view即将从window上移除(即将看不见)
 *
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"MJOneViewController-viewWillDisappear");
}

/**
 *  view从window上完全移除(完全看不见)
 *
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"MJOneViewController-viewDidDisappear");
}

/**
 *  view即将销毁的时候调用
 */
- (void)viewWillUnload
{
    [super viewWillUnload];
}

/**
 *  view销毁完毕的时候调用
 */
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // 由于控制器的view已经不在了,需要显示在view上面的一些数据也不需要
    self.apps = nil;
    self.persons = nil;
//    
//    [self.apps release];
//    [self.persons release];
}

/**
 *  当接收到内存警告的时候
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
