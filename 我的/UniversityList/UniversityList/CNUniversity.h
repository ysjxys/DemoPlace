//
//  CNUniversity.h
//  UniversityList
//
//  Created by ysj on 15/8/19.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNUniversity : NSObject

@property (nonatomic, copy) NSString *badgeimage;
@property (nonatomic, assign, getter=isUn211) BOOL un211;
@property (nonatomic, assign, getter=isUn985) BOOL un985;
@property (nonatomic, copy) NSString *manager;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *theIndex;


+ (instancetype)universityWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
