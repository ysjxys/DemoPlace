//
//  ViewController.m
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "FriendsGroup.h"
#import "FriendCell.h"
#import "FriendCellHeader.h"

@interface ViewController ()<FriendCellHeaderDelegate>

@property (nonatomic, strong) NSArray *friendsGroupArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    self.tableView.sectionHeaderHeight = 50;
}

- (void)headerViewDidClickedWithNameView:(FriendCellHeader *)header{
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCell *cell = [FriendCell friendWithTableView:tableView];
    FriendsGroup *gp = self.friendsGroupArr[indexPath.section];
    [cell setMyFriend:gp.friends[indexPath.row]];
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FriendCellHeader *header = [FriendCellHeader headerWithTableView:tableView];
    header.friendsGroup = self.friendsGroupArr[section];
    header.delegate = self;
    return header;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.friendsGroupArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendsGroup *fg = self.friendsGroupArr[section];
    return fg.isOpened?fg.friends.count:0;
}


- (NSArray *)friendsGroupArr{
    if (_friendsGroupArr == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:@""];
        NSArray *dicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in dicts) {
            [tempArr addObject:[FriendsGroup friendsGroupWithDict:dict]];
        }
        _friendsGroupArr = tempArr;
    }
    return _friendsGroupArr;
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
