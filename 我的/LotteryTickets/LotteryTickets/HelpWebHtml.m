//
//  HelpWebHtml.m
//  LotteryTickets
//
//  Created by ysj on 15/7/21.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "HelpWebHtml.h"

@implementation HelpWebHtml


+ (instancetype)htmlWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = [dict objectForKey:@"title"];
        self.html = [dict objectForKey:@"html"];
        self.ID = [dict objectForKey:@"id"];
    }
    return self;
}

@end
