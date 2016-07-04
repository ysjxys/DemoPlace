//
//  FriendCellHeader.h
//  QQFriends
//
//  Created by ysj on 15/6/24.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsGroup, FriendCellHeader;
@protocol FriendCellHeaderDelegate<NSObject>
@optional
- (void)headerViewDidClickedWithNameView:(FriendCellHeader *)header;
@end

@interface FriendCellHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) FriendsGroup *friendsGroup;
@property (nonatomic, strong) id<FriendCellHeaderDelegate> delegate;

+ (instancetype)headerWithTableView:(UITableView *)tableView;

@end
