//
//  CNUniversityGroup.m
//  UniversityList
//
//  Created by ysj on 15/8/22.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "CNUniversityGroup.h"
#import "CNUniversity.h"

@implementation CNUniversityGroup

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"theIndex"];
        NSArray *dicts = dict[@"universities"];
        NSMutableArray *unArr = [NSMutableArray array];
        for (NSDictionary *university in dicts) {
            CNUniversity *un = [CNUniversity universityWithDict:university];
            [unArr addObject:un];
        }
        self.universities = unArr;
    }
    return self;
}


+ (instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
