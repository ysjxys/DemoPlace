//
//  MJOneViewController.m
//  08-Modal-代码
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJOneViewController.h"
#import "MJTwoViewController.h"

@interface MJOneViewController ()
- (IBAction)jump;

@end

@implementation MJOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)jump {
    // 展示MJTwoViewController
    MJTwoViewController *two = [[MJTwoViewController alloc] init];
    
    [self presentViewController:two animated:YES completion:^{
        NSLog(@"展示MJTwoViewController完毕.......");
    }];
}
@end
