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

@interface MJViewController ()
@property (nonatomic, strong) NSArray *groups;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MJFriendGroup *group = self.groups[section];
    return group.name;
}
@end
