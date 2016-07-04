//
//  MJViewController.m
//  06-重绘(刷帧)
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJView.h"

@interface MJViewController ()
- (IBAction)sizeChange:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet MJView *circleView;

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

- (IBAction)sizeChange:(UISlider *)sender {
    self.circleView.radius = sender.value;
}
@end
