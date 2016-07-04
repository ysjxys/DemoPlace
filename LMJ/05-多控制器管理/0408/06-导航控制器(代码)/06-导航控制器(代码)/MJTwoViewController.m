//
//  MJTwoViewController.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTwoViewController.h"
#import "MJThreeViewController.h"

@interface MJTwoViewController ()
- (IBAction)jumpThree;

@end

@implementation MJTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
}

- (IBAction)jumpThree {
    MJThreeViewController *three = [[MJThreeViewController alloc] init];
    [self.navigationController pushViewController:three animated:YES];
}
@end
