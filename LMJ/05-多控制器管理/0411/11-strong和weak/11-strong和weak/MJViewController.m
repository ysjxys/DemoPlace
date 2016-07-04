//
//  MJViewController.m
//  11-strong和weak
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableViewController
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
