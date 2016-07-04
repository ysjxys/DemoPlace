//
//  ButtonData.m
//  ximalaya
//
//  Created by ysj on 15/6/9.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ButtonData.h"

@implementation ButtonData


- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        self.imgName = dict[@"picName"];
        self.describe = dict[@"describe"];
    }
    return self;
}

+ (instancetype)buttonDataWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


@end
