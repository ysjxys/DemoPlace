//
//  SettingArrowItem.h
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingBasicItem.h"

@interface SettingArrowItem : SettingBasicItem

@property (nonatomic, assign) Class destVcClass;

+ (instancetype) itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype) itemWithTitle:(NSString *)title icon:(NSString *)icon destVcClass:(Class)destVcClass;

@end
