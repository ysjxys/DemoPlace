//
//  Province.m
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Province.h"

@implementation Province


+ (instancetype)provinceWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.name = dict[@"name"];
        NSArray *arr = dict[@"cities"];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSString *str in arr) {
            [tempArr addObject:str];
        }
        self.cities = tempArr;
    }
    return self;
}

@end
