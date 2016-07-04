//
//  SettingBasicItem.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingBasicItem.h"

@implementation SettingBasicItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon{
    SettingBasicItem *setting = [self itemWithTitle:title];
    setting.icon = icon;
    return setting;
}


+ (instancetype)itemWithTitle:(NSString *)title{
    SettingBasicItem *setting = [[self alloc]init];
    setting.title = title;
    return setting;
}
@end
