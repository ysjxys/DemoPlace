//
//  Product.m
//  LotteryTickets
//
//  Created by ysj on 15/7/22.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Product.h"

@implementation Product

+ (instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.url = dict[@"url"];
        self.customUrl = dict[@"customUrl"];
        self.identifier = dict[@"id"];
    }
    return self;
}

@end
