//
//  Question.h
//  GuessPicture
//
//  Created by ysj on 15/6/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *options;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) questionWithDict:(NSDictionary *)dict;
@end
