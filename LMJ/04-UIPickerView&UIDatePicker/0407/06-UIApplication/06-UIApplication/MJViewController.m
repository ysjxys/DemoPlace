//
//  MJViewController.m
//  06-UIApplication
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)changeAppNum;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

- (IBAction)changeAppNum {
    UIApplication *app = [UIApplication sharedApplication];
//    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
//    app.statusBarHidden = YES;
//    app.statusBarStyle = UIStatusBarStyleLightContent;
    [app setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    // 0代表清除图标右上角的数字
//    app.applicationIconBadgeNumber = 0;
    
    // 设置显示联网状态
//    app.networkActivityIndicatorVisible = YES;
    
    // URL : 一个资源的唯一路径
    
    // URL的组成 == 协议头://主机域名/路径
    
    // 网络资源URL的组成 == http://www.baidu.com/1.png
    
    // 本地文件资源URL的组成 == file:///Users/apple/Desktop/1.png
    
//    [app openURL:[NSURL URLWithString:@"http://ios.itcast.cn"]];
    
    // 打电话
//    [app openURL:[NSURL URLWithString:@"tel://10086"]];
}
@end
