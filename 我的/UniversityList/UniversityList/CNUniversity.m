//
//  CNUniversity.m
//  UniversityList
//
//  Created by ysj on 15/8/19.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "CNUniversity.h"

@implementation CNUniversity

+ (instancetype)universityWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.badgeimage = dict[@"badgeimage"];
        self.un211 = dict[@"un211"]==[NSNumber numberWithInt:1]?YES:NO;
        self.un985 = dict[@"un985"]==[NSNumber numberWithInt:1]?YES:NO;
        self.manager = dict[@"manager"];
        self.kind = dict[@"kind"];
        self.name = dict[@"name"];
        self.province = dict[@"province"];
        self.theIndex = dict[@"theIndex"];
    }
    return self;
}

@end
