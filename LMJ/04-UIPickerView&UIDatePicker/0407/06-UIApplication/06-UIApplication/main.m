//
//  main.m
//  06-UIApplication
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, @"MJAppDelegate");
//        return UIApplicationMain(argc, argv, @"UIApplication", @"MJAppDelegate");
        return UIApplicationMain(argc, argv, NSStringFromClass([UIApplication class]), NSStringFromClass([MJAppDelegate class]));
    }
}
