//
//  MJBuyViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-16.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJBuyViewController.h"

@interface MJBuyViewController ()
- (IBAction)titleClick:(UIButton *)sender;

@end

@implementation MJBuyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)titleClick:(UIButton *)sender {
    // 1.按钮旋转
    [UIView animateWithDuration:0.25 animations:^{
        sender.imageView.transform = CGAffineTransformMakeRotation(-M_PI);
    }];
    
    // 2.添加uiview
    UIView *temp  = [[UIView alloc] init];
    temp.frame = CGRectMake(10, 10, 100, 30);
    temp.backgroundColor = [UIColor redColor];
    [self.view addSubview:temp];
}
@end
