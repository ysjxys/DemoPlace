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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
    NSLog(@"%@", self.view.window.rootViewController);
    NSLog(@"%@", self.view.window.subviews);
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"关闭MJTwoViewController....");
//    }];
}
@end
