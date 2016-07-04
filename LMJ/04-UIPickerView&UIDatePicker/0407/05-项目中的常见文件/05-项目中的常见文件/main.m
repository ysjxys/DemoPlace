//
//  main.m
//  05-项目中的常见文件
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJAppDelegate.h"

// 函数的外部声明
extern int test();

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        test();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([MJAppDelegate class]));
    }
}
