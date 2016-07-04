//
//  Friend.m
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


@end
