//
//  Question.m
//  GuessPicture
//
//  Created by ysj on 15/6/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Question.h"

@implementation Question


- (instancetype) initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.options = dict[@"options"];
    }
    return self;
}


+ (instancetype) questionWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
