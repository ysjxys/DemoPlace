//
//  FriendsGroup.h
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FriendsGroup : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, assign, getter=isOpened) BOOL opened;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict;

@end
