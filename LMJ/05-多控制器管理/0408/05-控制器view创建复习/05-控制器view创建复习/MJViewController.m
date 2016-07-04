//
//  MJViewController.m
//  05-控制器view创建复习
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

/**
 *  自定义view
 */
- (void)loadView
{
    self.view = [[UIImageView alloc] init];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
