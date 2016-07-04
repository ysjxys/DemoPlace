//
//  SettingBasicTableViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/21.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingBasicTableViewController.h"
#import "SettingArrowItem.h"
#import "SettingBasicItem.h"
#import "SettingGroup.h"
#import "SettingSwitchItem.h"
#import "SettingTableViewCell.h"

@implementation SettingBasicTableViewController


- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSMutableArray *)data{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SettingGroup *settingGroup = self.data[section];
    return settingGroup.items.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    SettingGroup *settingGroup = self.data[section];
    return settingGroup.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SettingGroup *settingGroup = self.data[section];
    return settingGroup.header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingTableViewCell *cell = [SettingTableViewCell cellWithTableView:tableView];
    SettingGroup *group = self.data[indexPath.section];
    cell.settingItem = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingGroup *settingGroup = self.data[indexPath.section];
    SettingBasicItem *item = settingGroup.items[indexPath.row];
    if (item.option) {
        item.option();
    }else if ([item isKindOfClass:[SettingArrowItem class]]){
        SettingArrowItem *arrowItem = (SettingArrowItem*)item;
        if (arrowItem.destVcClass) {
            UIViewController *controller = [[arrowItem.destVcClass alloc]init];
            controller.title = arrowItem.title;
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}


@end
