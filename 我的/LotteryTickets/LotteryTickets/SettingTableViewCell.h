//
//  SettingTableViewCell.h
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingBasicItem;
@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong)SettingBasicItem *settingItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
