//
//  MJBlueView.m
//  05-触摸事件的传递
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJBlueView.h"

@implementation MJBlueView
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"MJBlueView-----touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

@end
