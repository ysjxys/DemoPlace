//
//  MJAboutViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAboutViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingGroup.h"

@interface MJAboutViewController ()

@end

@implementation MJAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.具体数据
    MJSettingItem *mark = [MJSettingArrowItem itemWithTitle:@"评分支持" destVcClass:nil];
    MJSettingItem *call = [MJSettingArrowItem itemWithTitle:@"客户电话" destVcClass:nil];
    call.subtitle = @"10010";
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[mark, call];
    [self.data addObject:group];
    
    // 2.header
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
}
@end
