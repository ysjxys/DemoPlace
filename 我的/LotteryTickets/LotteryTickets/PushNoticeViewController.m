//
//  PushNoticeViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "PushNoticeViewController.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "TempViewController.h"
#import "ScoreViewController.h"

@implementation PushNoticeViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    [self initGroup0];
}

- (void)initGroup0{
    SettingGroup *settingGroup = [[SettingGroup alloc]init];
    SettingBasicItem *openItem = [SettingArrowItem itemWithTitle:@"开奖号码推送" destVcClass:[TempViewController class]];
    SettingBasicItem *animationItem = [SettingArrowItem itemWithTitle:@"中奖动画" destVcClass:[TempViewController class]];
    SettingBasicItem *scoreItem = [SettingArrowItem itemWithTitle:@"比分直播提醒" destVcClass:[ScoreViewController class]];
    SettingBasicItem *buyItem = [SettingArrowItem itemWithTitle:@"购彩定时提醒" destVcClass:[TempViewController class]];
    
    settingGroup.items = @[openItem,animationItem,scoreItem,buyItem];
    [self.data addObject:settingGroup];
}
@end
