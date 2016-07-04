//
//  MJAwardPushViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAwardPushViewController.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"

@interface MJAwardPushViewController ()

@end

@implementation MJAwardPushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MJSettingItem *ball = [MJSettingSwitchItem itemWithTitle:@"双色球"];
    MJSettingItem *letou = [MJSettingSwitchItem itemWithTitle:@"大乐透"];
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[ball, letou];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    [self.data addObject:group];
}

@end
