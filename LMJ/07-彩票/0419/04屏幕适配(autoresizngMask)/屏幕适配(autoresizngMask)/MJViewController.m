//
//  MJViewController.m
//  屏幕适配(autoresizngMask)
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /**
     Fixed
     
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,  距离父控件左边的间距是伸缩的
     UIViewAutoresizingFlexibleWidth        = 1 << 1,  自己的宽度跟随着父控件的宽度进行伸缩
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,  距离父控件右边的间距是伸缩的
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,  距离父控件顶部的间距是伸缩的
     UIViewAutoresizingFlexibleHeight       = 1 << 4,  自己的高度跟随着父控件的高度进行伸缩
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5   距离父控件底部的间距是伸缩的
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
