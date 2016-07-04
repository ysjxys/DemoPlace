//
//  CNUniversityGroup.h
//  UniversityList
//
//  Created by ysj on 15/8/22.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNUniversityGroup : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *universities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end
