//
//  MJViewController.m
//  02-CALayer02-新建图层
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 新建图层
//    CALayer *layer = [[CALayer alloc] init];
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 100);
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    layer.contents = (id)[UIImage imageNamed:@"lufy"].CGImage;
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
