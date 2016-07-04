//
//  MJViewController.m
//  05-项目中的常见文件
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int age = 10;
    double height = 1.55;
    
//    NSLog(@"----viewDidLoad-age=%d, height=%f", age, height);
    /**
     1.调试阶段:写代码,调错误(肯定需要打印)   系统会自动定义一个叫做DEBUG的宏
     
     2.发布阶段:写好的代码生成ipa等压缩包文件,上传到appstore,安装到用户的设备上(不需要打印)  系统会删掉叫做DEBUG的宏
     */
    
    MJLog(@"5345345 -  %d- %d", 10, 20);
    MJLog(@"5345345 -  ");
    MJLog(@"5345345 -  ");
    MJLog(@"5345345 -  ");
}

- (void)didReceiveMemoryWarning
{
    MJLog(@"---dasdfasf");
    [super didReceiveMemoryWarning];
}

@end
