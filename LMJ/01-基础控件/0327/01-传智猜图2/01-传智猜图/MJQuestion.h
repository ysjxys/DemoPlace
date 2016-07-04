//
//  MJQuestion.h
//  01-传智猜图
//
//  Created by apple on 14-3-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  题目模型(一个MJQuestion对象对应一道题目)

#import <Foundation/Foundation.h>

@interface MJQuestion : NSObject
/**
 *  答案
 */
@property (nonatomic, copy) NSString *answer;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  待选项
 */
@property (nonatomic, strong) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary *)dict;
@end
