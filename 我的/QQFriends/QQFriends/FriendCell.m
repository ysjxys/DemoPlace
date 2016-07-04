//
//  FriendCell.m
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"

@implementation FriendCell

+ (instancetype)friendWithTableView:(UITableView *)tableView{
    static NSString *ID = @"friendCell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (void)setMyFriend:(Friend *)myFriend{
    _myFriend = myFriend;
    self.imageView.image = [UIImage imageNamed:myFriend.icon];
    self.textLabel.text = myFriend.name;
    self.textLabel.textColor = myFriend.isVip?[UIColor redColor]:[UIColor blackColor];
    self.detailTextLabel.text = myFriend.intro;
}

@end
