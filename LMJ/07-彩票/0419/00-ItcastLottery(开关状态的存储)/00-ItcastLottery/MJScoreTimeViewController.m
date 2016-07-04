//
//  MJScoreTimeViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJScoreTimeViewController.h"
#import "MJSettingLabelItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"

@interface MJScoreTimeViewController ()

@end

@implementation MJScoreTimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0组
    MJSettingItem *notice = [MJSettingSwitchItem itemWithTitle:@"提醒我关注的比赛"];
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[notice];
    group0.footer = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    [self.data addObject:group0];
    
    // 1组
    MJSettingItem *satrtTime = [MJSettingLabelItem itemWithTitle:@"起始时间"];
    
    MJSettingGroup *group1 = [[MJSettingGroup alloc] init];
    group1.items = @[satrtTime];
    group1.header = @"只在以下时间接受比分直播";
    [self.data addObject:group1];
    
    // 2组
    MJSettingItem *endTime = [MJSettingLabelItem itemWithTitle:@"结束时间"];
    
    MJSettingGroup *group2 = [[MJSettingGroup alloc] init];
    group2.items = @[endTime];
    [self.data addObject:group2];
}

@end
