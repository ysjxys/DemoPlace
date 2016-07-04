//
//  HeroData.m
//  TestUITableView
//
//  Created by ysj on 15/6/18.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "HeroData.h"

@implementation HeroData


- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype) heroWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


@end
