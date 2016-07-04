//
//  Friend.h
//  QQFriends
//
//  Created by ysj on 15/6/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;

@end
