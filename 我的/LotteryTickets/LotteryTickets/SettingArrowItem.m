//
//  SettingArrowItem.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem


+ (instancetype) itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass{
    SettingArrowItem *setting = [self itemWithTitle:title];
    setting.destVcClass = destVcClass;
    return setting;
}


+ (instancetype) itemWithTitle:(NSString *)title icon:(NSString *)icon destVcClass:(Class)destVcClass{
    SettingArrowItem *setting = [self itemWithTitle:title icon:icon];
    setting.destVcClass = destVcClass;
    return setting;
}


@end
