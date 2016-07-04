//
//  MJCarGroup.m
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJCarGroup.h"
#import "MJCar.h"

@implementation MJCarGroup
+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 赋值标题
        self.title = dict[@"title"];
        
        // 取出原来的字典数组
        NSArray *dictArray = dict[@"cars"];
        NSMutableArray *carArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJCar *car = [MJCar carWithDict:dict];
            [carArray addObject:car];
        }
        self.cars = carArray;
    }
    return self;
}
@end
