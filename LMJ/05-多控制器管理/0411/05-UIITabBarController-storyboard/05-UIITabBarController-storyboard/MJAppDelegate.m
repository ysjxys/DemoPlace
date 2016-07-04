//
//  MJAppDelegate.m
//  05-UIITabBarController-storyboard
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAppDelegate.h"

@implementation MJAppDelegate

/**
 *  app加载完毕的时候调用(一般只调用一次)
 *
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"didFinishLaunchingWithOptions");
    return YES;
}

/**
 *  app失去焦点的时候调用(UI控件不能正常使用)
 */
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
}

/**
 *  app进入后台的时候调用(app消失不见)
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
}

/**
 *  app进入前台的时候调用(app显示出来)
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
}

/**
 *  当app获得焦点的时候调用(这时候整个app的UI控件都能正常使用)
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
//    UITabBarController *tabbarVc = (UITabBarController *)self.window.rootViewController;
//    NSLog(@"%@", NSStringFromCGRect(tabbarVc.tabBar.frame));
    
//    for (UIView *child in tabbarVc.tabBar.subviews) {
//        if ([child isKindOfClass:[UIImageView class]]) {
//            [child removeFromSuperview];
//        }
//    }
    NSLog(@"applicationDidBecomeActive");
}

//app进入后台:休眠,  不能接受事情(比如关闭)
/**
 *  app关闭的时候调用(一般情况下不会调用)
 */
- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate");
}

@end
