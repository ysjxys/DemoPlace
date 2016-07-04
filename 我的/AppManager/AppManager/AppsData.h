//
//  AppsData.h
//  AppManager
//
//  Created by ysj on 15/6/3.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppsData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
