//
//  StatusData.h
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusData : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) BOOL vip;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) statusWithDict:(NSDictionary *)dict;
@end
