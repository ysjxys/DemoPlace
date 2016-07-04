//
//  MJPushNoticeViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJPushNoticeViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
#import "MJTest1ViewController.h"
#import "MJTest2ViewController.h"
#import "MBProgressHUD+MJ.h"
#import "MJProductViewController.h"
#import "MJPushNoticeViewController.h"
#import "MJAwardPushViewController.h"
#import "MJAwardAnimViewController.h"
#import "MJScoreTimeViewController.h"

@interface MJPushNoticeViewController ()
@end

@implementation MJPushNoticeViewController
/**
 *  第0组数据
 */
- (void)setupGroup0
{
    MJSettingItem *awardPush = [MJSettingArrowItem itemWithTitle:@"开奖号码推送" destVcClass:[MJAwardPushViewController class]];
    MJSettingItem *awardAnim = [MJSettingArrowItem itemWithTitle:@"中奖动画" destVcClass:[MJAwardAnimViewController class]];
    MJSettingItem *scoreTime = [MJSettingArrowItem itemWithTitle:@"比分直播提醒" destVcClass:[MJScoreTimeViewController class]];
    MJSettingItem *pushNotice4 = [MJSettingArrowItem itemWithTitle:@"购彩定时提醒" destVcClass:[MJTest1ViewController class]];
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[awardPush, awardAnim, scoreTime, pushNotice4];
    [self.data addObject:group];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
}
@end
