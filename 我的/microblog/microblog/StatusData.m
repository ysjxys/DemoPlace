//
//  StatusData.m
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "StatusData.h"

@implementation StatusData

- (instancetype) initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype) statusWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


@end
