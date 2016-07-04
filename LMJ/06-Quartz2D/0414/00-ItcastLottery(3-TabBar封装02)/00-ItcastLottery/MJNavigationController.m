//
//  MJNavigationController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJNavigationController.h"

@interface MJNavigationController ()

@end

@implementation MJNavigationController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

/**
 *  系统在第一次使用这个类的时候调用(1个类只会调用一次)
 */
+ (void)initialize
{
    // 设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景图片
    NSString *bgName = nil;
    if (iOS7) { // 至少是iOS 7.0
        bgName = @"NavBar64";
    } else { // 非iOS7
        bgName = @"NavBar";
    }
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    
    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[UITextAttributeTextColor] = [UIColor whiteColor];
    attrs[UITextAttributeFont] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attrs];
}

/**
 *  重写这个方法,能拦截所有的push操作
 *
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    return [super popViewControllerAnimated:NO];
//}
@end
