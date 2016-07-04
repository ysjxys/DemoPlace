//
//  MJShareViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJShareViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingGroup.h"

@interface MJShareViewController ()

@end

@implementation MJShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MJSettingItem *sina = [MJSettingArrowItem itemWithIcon:nil title:@"新浪微博" destVcClass:nil];
    MJSettingItem *sms = [MJSettingArrowItem itemWithIcon:nil title:@"短信分享" destVcClass:nil];
    sms.option = ^{
        
    };
    MJSettingItem *mail = [MJSettingArrowItem itemWithIcon:nil title:@"邮件分享" destVcClass:nil];
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[sina, sms, mail];
    [self.data addObject:group];
}
@end
