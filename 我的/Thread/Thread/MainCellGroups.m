//
//  MainCellGroup.m
//  Thread
//
//  Created by ysj on 15/8/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MainCellGroups.h"

@implementation MainCellGroups


+ (instancetype)groupWithItems:(NSArray *)items{
    MainCellGroups *group = [[self alloc]init];
    group.items = items;
    return group;
}
@end
