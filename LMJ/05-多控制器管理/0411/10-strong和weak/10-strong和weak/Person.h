//
//  Person.h
//  10-strong和weak
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject
@property (nonatomic, strong) Dog *dog;
@end
