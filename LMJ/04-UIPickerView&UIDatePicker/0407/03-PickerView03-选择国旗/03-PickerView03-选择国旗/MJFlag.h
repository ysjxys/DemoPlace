//
//  MJFlag.h
//  03-PickerView03-选择国旗
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJFlag : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

+ (instancetype)flagWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
