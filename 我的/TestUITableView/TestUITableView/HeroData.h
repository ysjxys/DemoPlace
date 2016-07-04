//
//  HeroData.h
//  TestUITableView
//
//  Created by ysj on 15/6/18.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroData : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) heroWithDict:(NSDictionary *)dict;
@end
