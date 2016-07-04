//
//  SettingTableViewCell.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "SettingBasicItem.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "SettingViewItem.h"

@interface SettingTableViewCell()
@property (nonatomic, strong) UISwitch* switchView;
@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UIView *rightView;

@end

@implementation SettingTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    NSString *ID = @"settingView";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (void)setSettingItem:(SettingBasicItem *)settingItem{
    _settingItem = settingItem;
    [self setData];
    [self setRightContent];
}

- (void)setData{
    if (self.settingItem.icon) {
        self.imageView.image = [UIImage imageNamed:self.settingItem.icon];
    }
    self.textLabel.text = self.settingItem.title;
    self.detailTextLabel.text = self.settingItem.subTitle;
}

- (void)setRightContent{
    if ([self.settingItem isKindOfClass:[SettingSwitchItem class]]) {
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        self.switchView.on = [user objectForKey:self.settingItem.title];
    }else if([self.settingItem isKindOfClass:[SettingArrowItem class]]){
        self.accessoryView = self.arrowView;
    }else if([self.settingItem isKindOfClass:[SettingViewItem class]]){
        self.accessoryView = self.rightView;
    }else{
        self.accessoryView = nil;
    }
}

- (UIImageView *)arrowView{
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

- (UISwitch *)switchView{
    if (!_switchView) {
        _switchView = [[UISwitch alloc]init];
        [_switchView addTarget:self action:@selector(switchValueChanged) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

- (void)switchValueChanged{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setBool:self.switchView.isOn forKey:self.settingItem.title];
    [user synchronize];
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc]init];
        _rightView.bounds = CGRectMake(0, 0, 100, 30);
        _rightView.backgroundColor = [UIColor purpleColor];
    }
    return _rightView;
}

@end
