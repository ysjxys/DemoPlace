//
//  SettingGroup.h
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject

@property (nonatomic, copy) NSString *footer;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, strong) NSArray *items;

@end
