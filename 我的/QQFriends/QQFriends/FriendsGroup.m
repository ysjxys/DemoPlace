//
//  FriendsGroup.m
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "FriendsGroup.h"
#import "Friend.h"

@implementation FriendsGroup


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *friend in self.friends) {
            [arr addObject:[Friend friendWithDict:friend]];
        }
        self.friends = arr;
    }
    return self;
}


+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


@end
