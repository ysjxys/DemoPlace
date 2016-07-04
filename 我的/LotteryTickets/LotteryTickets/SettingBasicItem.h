//
//  SettingBasicItem.h
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SettingBasicItemOption)();
@interface SettingBasicItem : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) SettingBasicItemOption option;
@property(nonatomic, copy) NSString *subTitle;

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
