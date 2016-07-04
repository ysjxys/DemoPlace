//
//  MJQuestion.m
//  01-传智猜图
//
//  Created by apple on 14-3-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJQuestion.h"

@implementation MJQuestion
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.answer = dict[@"answer"];
        self.options = dict[@"options"];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
