//
//  MJFlag.m
//  03-PickerView03-选择国旗
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJFlag.h"

@implementation MJFlag
+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
