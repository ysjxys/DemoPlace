//
//  MJCarGroup.h
//  01-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  一组数据

#import <Foundation/Foundation.h>

@interface MJCarGroup : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  尾部标题(描述)
 */
@property (nonatomic, copy) NSString *desc;

/**
 *  这组的所有车(字符串)
 */
@property (nonatomic, strong) NSArray *cars;
@end
