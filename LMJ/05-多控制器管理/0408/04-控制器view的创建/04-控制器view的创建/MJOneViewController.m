//
//  MJOneViewController.m
//  04-控制器view的创建
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJOneViewController.h"

@interface MJOneViewController ()

@end

@implementation MJOneViewController

/**
 *  loadView方法是用来自定义view
 */
//- (void)loadView
//{
//    NSLog(@"loadView---");
//    self.view = [[UIView alloc] init];
//    self.view.backgroundColor = [UIColor purpleColor];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad---");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
