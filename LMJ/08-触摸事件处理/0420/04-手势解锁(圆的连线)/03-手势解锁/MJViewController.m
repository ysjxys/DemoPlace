//
//  MJViewController.m
//  03-手势解锁
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJLockView.h"

@interface MJViewController () <MJLockViewDelegate>

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)lockView:(MJLockView *)lockView didFinishPath:(NSString *)path
{
    NSLog(@"获得用户的手势路径:%@", path);
}

@end
