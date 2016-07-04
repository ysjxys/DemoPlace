//
//  MJThreeViewController.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJThreeViewController.h"

@interface MJThreeViewController ()
- (IBAction)backTwo;
- (IBAction)backOne;
@end

@implementation MJThreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"第3个控制器";
    
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems = @[item1, item2];
}

- (IBAction)backTwo {
    // 移除栈顶控制器即可
    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController popToViewController:two animated:ye];
}

- (IBAction)backOne {
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self.navigationController popToViewController:one animated:<#(BOOL)#>];
}
@end
