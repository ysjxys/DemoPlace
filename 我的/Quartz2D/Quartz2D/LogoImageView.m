//
//  LogoImageView.m
//  Quartz2D
//
//  Created by ysj on 15/7/14.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LogoImageView.h"

@implementation LogoImageView


- (void)drawRect:(CGRect)rect {
    UIImage *me = [UIImage imageNamed:@"me"];
    //平铺
//    [me drawAsPatternInRect:CGRectMake(0, 0, 100, 100)];
    //拉伸
    [me drawInRect:CGRectMake(0, 0, 100, 100)];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    NSString *text = @"logo在此";
    [text drawInRect:CGRectMake(0, 0, 80, 30) withAttributes:attr];
}

@end
