//
//  MainBasicCell.m
//  Thread
//
//  Created by ysj on 15/8/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MainBasicCellItem.h"

@implementation MainBasicCellItem

+ (instancetype)itemWithTitle:(NSString *)title{
    MainBasicCellItem *item = [[self alloc]init];
    item.title = title;
    return item;
}
@end
