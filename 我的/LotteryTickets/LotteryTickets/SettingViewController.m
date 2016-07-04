//
//  SettingViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingBasicItem.h"
#import "PushNoticeViewController.h"
#import "HelpViewController.h"
#import "ShareViewController.h"
#import "TempViewController.h"
#import "SettingGroup.h"
#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD.h"
#import "SettingSwitchItem.h"
#import "SettingArrowItem.h"
#import "ProductViewController.h"
#import "AboutViewController.h"

@interface SettingViewController()

@end
@implementation SettingViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"设置";
    [self initGroup0];
    [self initGroup1];
}

- (void)initGroup0{
    SettingGroup *settingGroup = [[SettingGroup alloc]init];
    SettingBasicItem *pushNoticeItem = [SettingArrowItem itemWithTitle:@"推送和提醒" icon:@"MorePush" destVcClass:[PushNoticeViewController class]];
    SettingBasicItem *rocksItem = [SettingSwitchItem itemWithTitle:@"摇一摇机选" icon:@"handShake"];
    SettingBasicItem *voiceSetItem = [SettingSwitchItem itemWithTitle:@"声音效果" icon:@"sound_Effect"];
    settingGroup.items = @[pushNoticeItem,rocksItem,voiceSetItem];
    [self.data addObject:settingGroup];
}

- (void)initGroup1{
    SettingGroup *settingGroup = [[SettingGroup alloc]init];
    SettingBasicItem *updateItem = [SettingArrowItem itemWithTitle:@"检查新版本" icon:@"MoreUpdate"];
    updateItem.option = ^{
        [MBProgressHUD showMessage:@"loading"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"已经是最新版本"];
        });
    };
    SettingBasicItem *helpItem = [SettingArrowItem itemWithTitle:@"帮助" icon:@"MoreHelp" destVcClass:[HelpViewController class]];
    SettingBasicItem *shareItem = [SettingArrowItem itemWithTitle:@"分享" icon:@"MoreShare" destVcClass:[ShareViewController class]];
    SettingBasicItem *checkMessageItem = [SettingArrowItem itemWithTitle:@"查看消息" icon:@"MoreMessage" destVcClass:[TempViewController class]];
    SettingBasicItem *suggestItem = [SettingArrowItem itemWithTitle:@"产品推荐" icon:@"MoreNetease" destVcClass:[ProductViewController class]];
    SettingBasicItem *aboutItem = [SettingArrowItem itemWithTitle:@"关于" icon:@"MoreAbout" destVcClass:[AboutViewController class]];
    settingGroup.items = @[updateItem,helpItem,shareItem,checkMessageItem,suggestItem,aboutItem];
    [self.data addObject:settingGroup];
}




@end
