//
//  MJAppDelegate.m
//  02-控制器的创建方式
//
//  Created by apple on 14-4-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAppDelegate.h"
#import "MJTwoViewController.h"
#import "MJOneViewController.h"
#import "MJThreeViewController.h"

// 蓝色\灰色

@implementation MJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MJThreeViewController *three = [[MJThreeViewController alloc] initWithNibName:@"MJThree5345" bundle:nil];
    self.window.rootViewController = three;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)test
{
    //    MJOneViewController *one = [[MJOneViewController alloc] init];
    //    one.view.backgroundColor = [UIColor blueColor];
    //    self.window.rootViewController = one;
    
    //    MJTwoViewController *two = [[MJTwoViewController alloc] init];
    //    two.view.backgroundColor = [UIColor blueColor];
    //    self.window.rootViewController = two;
    
    // 加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Two" bundle:nil];
    
    // 创建storyboard里面灰色的控制器
    //    UIViewController *vc = [storyboard instantiateInitialViewController];
    MJTwoViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"pink"];
    self.window.rootViewController = vc;
    
    NSLog(@"%@", vc);
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

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
