//
//  Person.m
//  10-strong和weak
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"Person----dealloc");
}
@end
