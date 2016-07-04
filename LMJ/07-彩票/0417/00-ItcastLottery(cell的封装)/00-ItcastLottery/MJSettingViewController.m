//
//  MJSettingViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJSettingViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
#import "MJTest1ViewController.h"
#import "MJTest2ViewController.h"
#import "MBProgressHUD+MJ.h"
#import "MJProductViewController.h"
#import "MJPushNoticeViewController.h"
#import "MJHelpViewController.h"

@interface MJSettingViewController ()
@end

@implementation MJSettingViewController
/**
 *  第1组数据
 */
- (void)setupGroup1
{
    MJSettingItem *update = [MJSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在拼命检查中....."];
        
#warning 发送网络请求
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    MJSettingItem *help = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[MJHelpViewController class]];
    MJSettingItem *share = [MJSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[MJTest2ViewController class]];
    MJSettingItem *viewMsg = [MJSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[MJTest2ViewController class]];
    MJSettingItem *product = [MJSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[MJProductViewController class]];
    MJSettingItem *about = [MJSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[MJTest2ViewController class]];
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[update, help, share, viewMsg, product, about];
    [self.data addObject:group];
}

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    MJSettingItem *pushNotice = [MJSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MJPushNoticeViewController class]];
    MJSettingItem *handShake = [MJSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    MJSettingItem *soundEffect = [MJSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[pushNotice, handShake, soundEffect];
    [self.data addObject:group];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.标题
    self.title = @"设置";
    
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
}
@end
