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
    
    // 0.总列数(一行最多3列)
    int totalColumns = 3;
    
    // 1.应用的尺寸
    CGFloat appW = 85;
    CGFloat appH = 90;
    
    // 2.间隙 = (控制器view的宽度 - 3 * 应用宽度) / 4
    CGFloat marginX = (self.view.frame.size.width - totalColumns * appW) / (totalColumns + 1);
    CGFloat marginY = 15;
    
    // 3.根据应用个数创建对应的框框(index 0 ~ 11)
    for (int index = 0; index<self.apps.count; index++) {
        // 3.1.创建1小框框
        UIView *appView = [[UIView alloc] init];
        // 设置背景色
//        appView.backgroundColor = [UIColor redColor];
    
        // 3.2.计算框框的位置
        // 计算行号和列号
        int row = index / totalColumns;
        int col = index % totalColumns;
        // 计算x和y
        CGFloat appX = marginX + col * (appW + marginX);
        CGFloat appY = 30 + row * (appH + marginY);
        // 设置frame
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 3.3.添加框框到控制器的view
        [self.view addSubview:appView];
        
        // 3.4.添加内部的小控件
        // 3.4.0.index位置对应的应用信息
        NSDictionary *appInfo = self.apps[index];
        
        // 3.4.1.添加图片
        UIImageView *iconView = [[UIImageView alloc] init];
        // 设置位置
        CGFloat iconW = 45;
        CGFloat iconH = 45;
        CGFloat iconX = (appW - iconW) * 0.5;
        CGFloat iconY = 0;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
        // 设置图片
        iconView.image = [UIImage imageNamed:appInfo[@"icon"]];
        [appView addSubview:iconView];
        
        // 3.4.2.添加名字
        UILabel *nameLabel = [[UILabel alloc] init];
        // 设置位置
        CGFloat nameW = appW;
        CGFloat nameH = 20;
        CGFloat nameX = 0;
        CGFloat nameY = iconY + iconH;
        nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
        // 设置文字
        nameLabel.text = appInfo[@"name"];
        // 设置字体
        nameLabel.font = [UIFont systemFontOfSize:13];
        // 设置文字居中对齐
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [appView addSubview:nameLabel];
        
        // 3.4.3.添加下载按钮
        UIButton *downloadBtn = [[UIButton alloc] init];
        // 设置位置
        CGFloat downloadX = 12;
        CGFloat downloadY = nameY + nameH;
        CGFloat downloadW = appW - 2 * downloadX;
        CGFloat downloadH = 20;
        downloadBtn.frame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
        // 设置默认的背景
        UIImage *normalImage = [UIImage imageNamed:@"buttongreen"];
        [downloadBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
        // 设置高亮的背景
        UIImage *highImage = [UIImage imageNamed:@"buttongreen_highlighted"];
        [downloadBtn setBackgroundImage:highImage forState:UIControlStateHighlighted];
        // 设置按钮的文字
        [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        // 不推荐直接拿到按钮内部的label设置文字
        //        downloadBtn.titleLabel.text = @"5435345345";
        // 设置按钮文字的字体
        downloadBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [appView addSubview:downloadBtn];
    }
}

- (NSArray *)apps
{
    if (_apps == nil) {
        // 初始化
        
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 2.加载数组
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

@end
