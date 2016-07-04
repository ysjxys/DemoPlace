//
//  Person.m
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Person.h"

@implementation Person


- (Person *) initWithName:(NSString *)name andAge:(int)age{
    self.name = name;
    self.age = age;
    return self;
}

- (Person *) initWithName:(NSString *)name andAge:(int)age andHeight:(int)height{
    self.name = name;
    self.age = age;
    self.height = height;
    return self;
}

@end
