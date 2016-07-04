//
//  Person.h
//  02-KVC
//
//  Created by apple on 14-3-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

@property (nonatomic, strong) Book *book;

@end
