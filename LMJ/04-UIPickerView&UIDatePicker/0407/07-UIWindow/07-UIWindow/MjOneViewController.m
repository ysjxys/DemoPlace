//
//  MjOneViewController.m
//  07-UIWindow
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MjOneViewController.h"

@interface MjOneViewController ()

@end

@implementation MjOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UISwitch *s = [[UISwitch alloc] init];
    [self.view addSubview:s];
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
