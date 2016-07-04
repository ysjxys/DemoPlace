//
//  MainCellGroup.h
//  Thread
//
//  Created by ysj on 15/8/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCellGroups : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)groupWithItems:(NSArray *)items;
@end
