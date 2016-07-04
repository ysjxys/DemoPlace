//
//  MJViewController.m
//  03-QQ好友列表
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJFriendGroup.h"
#import "MJFriend.h"
#import "MJHeaderView.h"

@interface MJViewController ()
@property (nonatomic, strong) NSArray *groups;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 每一行cell的高度
    self.tableView.rowHeight = 50;
    // 每一组头部控件的高度
    self.tableView.sectionHeaderHeight = 44;
}

- (NSArray *)groups
{
    if (_groups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJFriendGroup *group = [MJFriendGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MJFriendGroup *group = self.groups[section];
    return group.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    static NSString *ID = @"friend";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 2.设置cell的数据
    MJFriendGroup *group = self.groups[indexPath.section];
    MJFriend *friend = group.friends[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.intro;
    
    return cell;
}

/**
 *  返回每一组需要显示的头部标题(字符出纳)
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    MJFriendGroup *group = self.groups[section];
//    return group.name;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1.创建头部控件
    MJHeaderView *header = [MJHeaderView headerViewWithTableView:tableView];
    
    // 2.给header设置数据(给header传递模型)
    return header;
}

/**
 *  设置每一行头部的高度
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 44;
//}

@end
