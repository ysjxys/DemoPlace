//
//  ButtonData.h
//  ximalaya
//
//  Created by ysj on 15/6/9.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ButtonData : NSObject


@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *describe;



- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)buttonDataWithDict:(NSDictionary *)dict;


@end
