//
//  HelpWebHtml.h
//  LotteryTickets
//
//  Created by ysj on 15/7/21.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelpWebHtml : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (instancetype)htmlWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
