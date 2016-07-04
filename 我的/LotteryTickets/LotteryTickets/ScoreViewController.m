//
//  ScoreViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/21.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ScoreViewController.h"
#import "SettingGroup.h"
#import "SettingSwitchItem.h"
#import "SettingBasicItem.h"
#import "SettingViewItem.h"

@implementation ScoreViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self initGroup0];
    [self initGroup1];
}

- (void)initGroup0{
    SettingGroup *group = [[SettingGroup alloc]init];
    SettingBasicItem *warnItem = [SettingSwitchItem itemWithTitle:@"提醒我关注的比赛"];
    group.footer = @"当我关注的比赛比分发生变化时，通过小弹窗或者推送进行提醒";
    group.items = @[warnItem];
    [self.data addObject:group];
}

- (void)initGroup1{
    SettingGroup *group = [[SettingGroup alloc]init];
    SettingBasicItem *startItem = [SettingViewItem itemWithTitle:@"起始时间"];
    SettingViewItem *endItem = [SettingViewItem itemWithTitle:@"结束时间"];
    group.header = @"只在以下时间接受比分直播";
    group.items = @[startItem,endItem];
    [self.data addObject:group];
}

@end
