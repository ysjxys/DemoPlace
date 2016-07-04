//
//  MJViewController.m
//  01-应用管理
//
//  Created by apple on 14-3-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
/** 存放应用信息 */
@property (nonatomic, strong) NSArray *apps;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加应用信息
    
    // 应用的尺寸
    CGFloat appW = 85;
    CGFloat appH = 90;
    
    // 间隙= (控制器view的宽度 - 3 * 应用宽度) / 4
    CGFloat margin = (self.view.frame.size.width - 3 * appW) / 4;
    
    // 尝试添加1个小框框
    UIView *appView = [[UIView alloc] init];
    appView.backgroundColor = [UIColor redColor];
    CGFloat appX = margin;
    CGFloat appY = 30;
    appView.frame = CGRectMake(appX, appY, appW, appH);
    [self.view addSubview:appView];
    
    // 尝试添加2个小框框
    UIView *appView2 = [[UIView alloc] init];
    appView2.backgroundColor = [UIColor blueColor];
    CGFloat appX2 = appX + appW + margin;
    CGFloat appY2 = 30;
    appView2.frame = CGRectMake(appX2, appY2, appW, appH);
    [self.view addSubview:appView2];
    
    // 尝试添加3个小框框U
    UIView *appView3 = [[UIView alloc] init];
    appView3.backgroundColor = [UIColor greenColor];
    CGFloat appX3 = appX2 + appW + margin;
    CGFloat appY3 = 30;
    appView3.frame = CGRectMake(appX3, appY3, appW, appH);
    [self.view addSubview:appView3];
    
    // 尝试添加4个小框框
    UIView *appView4 = [[UIView alloc] init];
    appView4.backgroundColor = [UIColor grayColor];
    CGFloat appX4 = appX;
    CGFloat appY4 = 30 + margin + appH;
    appView4.frame = CGRectMake(appX4, appY4, appW, appH);
    [self.view addSubview:appView4];
}

- (NSArray *)apps
{
    if (_apps == nil) {
        // 初始化
        
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 2.加载数组
        _apps = [NSArray arrayWithContentsOfFile:path];
        
        NSLog(@"%@", _apps);
    }
    return _apps;
}

@end
