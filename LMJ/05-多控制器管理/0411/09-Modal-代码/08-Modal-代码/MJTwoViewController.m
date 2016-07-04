//
//  MJTwoViewController.m
//  08-Modal-代码
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTwoViewController.h"

@interface MJTwoViewController ()
- (IBAction)cancel;

@end

@implementation MJTwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"第2个控制器";
//    self.navigationItem.title
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
//    NSLog(@"%@", self.view.window.rootViewController);
//    NSLog(@"%@", self.view.window.subviews);
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭MJTwoViewController....");
    }];
//    [self.navigationController dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"关闭MJTwoViewController....");
//    }];
}
@end
