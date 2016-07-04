//
//  Student+quit.m
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Student+quit.h"

@implementation Student (quit)

+ (NSString *) className
{
    NSLog(@"self %@",self);
    return NSStringFromClass([self class]);
}

- (NSString *) className
{
    return NSStringFromClass([self class]);
}
@end
