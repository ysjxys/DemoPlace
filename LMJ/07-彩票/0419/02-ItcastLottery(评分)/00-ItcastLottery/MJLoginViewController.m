//
//  MJLoginViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-16.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJLoginViewController.h"
#import "UIImage+Extension.h"
#import "MJSettingViewController.h"

@interface MJLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)setting;

@end

@implementation MJLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *normal = [UIImage resizableImage:@"RedButton"];
    UIImage *high = [UIImage resizableImage:@"RedButtonPressed"];
    
    [self.loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:high forState:UIControlStateHighlighted];
}

- (IBAction)setting {
    MJSettingViewController *settingVc = [[MJSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
}
@end
