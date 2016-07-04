//
//  MJAppDelegate.m
//  06-导航控制器(代码)
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAppDelegate.h"
#import "MJOneViewController.h"

@implementation MJAppDelegate

//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = [UIColor redColor];
//    [nav pushViewController:vc1 animated:YES];

//    UIViewController *vc2 = [[UIViewController alloc] init];
//    vc2.view.backgroundColor = [UIColor greenColor];
//    [nav pushViewController:vc2 animated:YES];
//
//    UIViewController *vc3 = [[UIViewController alloc] init];
//    vc3.view.backgroundColor = [UIColor blueColor];
//    [nav pushViewController:vc3 animated:YES];

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 1.创建导航控制器
    MJOneViewController *one = [[MJOneViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:one];
    
    // 存放所有子控制器的栈
//    nav.viewControllers
    // 这个数组也存放子控制器
//    nav.childViewControllers
    // 2.添加子控制器
//    MJOneViewController *one = [[MJOneViewController alloc] init];
//    [nav addChildViewController:one];
//    [nav pushViewController:one animated:YES];
//    nav.viewControllers = @[one];
    
    // 3.设置为窗口的根控制器
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

/**
 *  程序获得了焦点就会自动调用这个方法(只要程序获得了焦点,所有控件才能接收触摸事件)
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSString *xml = [self digView:self.window];
    [xml writeToFile:@"/Users/aplle/Documents/window.xml" atomically:YES];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSString *)digView:(UIView *)view
{
    if ([view isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", view.class, NSStringFromCGRect(view.frame)];
    if (!CGPointEqualToPoint(view.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(view.bounds)];
    }
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)view;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (view.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in view.subviews) {
        NSString *childXml = [self digView:child];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", view.class];
    
    return xml;
}

@end
