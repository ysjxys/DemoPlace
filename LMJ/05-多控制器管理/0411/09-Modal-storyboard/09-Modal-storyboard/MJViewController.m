//
//  MJViewController.m
//  09-Modal-storyboard
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJTwoViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *nav = segue.destinationViewController;
    
    MJTwoViewController *two = (MJTwoViewController *)nav.topViewController;
    
    two.name = @"发哈舒服就好速度集合分";
    
}

@end
