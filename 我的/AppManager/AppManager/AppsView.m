//
//  AppsView.m
//  AppManager
//
//  Created by ysj on 15/6/3.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "AppsView.h"
#import "AppsData.h"

@interface AppsView()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *nameLabel;
@end

@implementation AppsView


+ (instancetype)appsView{
    AppsView *view = [[AppsView alloc]initWithFrame:CGRectMake(0, 0, 85, 90)];
    
    view.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 45, 45)];
    [view addSubview:view.imageView];
    
    view.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 47, 85, 20)];
    [view.nameLabel setFont:[UIFont systemFontOfSize:13]];
    [view.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [view addSubview:view.nameLabel];
    
    UIButton *downBtn = [[UIButton alloc]initWithFrame:CGRectMake(13, 68, 58, 20)];
    [downBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    [downBtn setTitle:@"下载" forState:UIControlStateNormal];
    [downBtn setTitle:@"下载" forState:UIControlStateHighlighted];
    downBtn.titleLabel.font = [UIFont systemFontOfSize:13.0 ];
    [view addSubview:downBtn];
    [downBtn addTarget:view action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}

- (void)test{
    NSLog(@"xx");
    if([self.delegate respondsToSelector:@selector(appsClick:)]){
        [self.delegate appsClick:self];
    }
}

- (void)btnClick:(UIButton *)btn{
    NSLog(@"xx");
    if([self.delegate respondsToSelector:@selector(appsClick:)]){
        [self.delegate appsClick:self];
    }
}

- (instancetype)initWithAppsData:(AppsData *)appsData{
    self = [AppsView appsView];
    self.appsData = appsData;
    return self;
}

+ (instancetype)appsViewWithAppsData:(AppsData *)appsData{
    return [[self appsView] initWithAppsData:appsData];
}

- (void)setAppsData:(AppsData *)appsData{
    _appsData = appsData;
    self.nameLabel.text = appsData.name;
    self.imageView.image = [UIImage imageNamed:appsData.icon];
}

@end



