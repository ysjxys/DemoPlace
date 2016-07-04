//
//  Weibo.m
//  04-UITableView03-通过代码定义cell
//
//  Created by apple on 13-12-1.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJStatus.h"

@implementation MJStatus

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
