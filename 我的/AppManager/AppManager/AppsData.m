//
//  AppsData.m
//  AppManager
//
//  Created by ysj on 15/6/3.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "AppsData.h"

@implementation AppsData

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}


+ (instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
