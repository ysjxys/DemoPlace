//
//  MJProduct.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJProduct.h"

@implementation MJProduct
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
//        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
