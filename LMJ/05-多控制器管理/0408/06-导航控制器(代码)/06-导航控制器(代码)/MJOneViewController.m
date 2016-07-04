//
//  MJOneViewController.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJOneViewController.h"
#import "MJTwoViewController.h"

@interface MJOneViewController ()
- (IBAction)jumpTwo;
@end

@implementation MJOneViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"第1个控制器";
    
    // 修改下一个界面返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
}

- (IBAction)jumpTwo {
    // 调到第2个控制器
    MJTwoViewController *two = [[MJTwoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
}
@end
