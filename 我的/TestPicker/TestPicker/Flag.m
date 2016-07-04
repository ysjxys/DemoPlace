//
//  Flag.m
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Flag.h"

@implementation Flag


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (instancetype)flagWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
