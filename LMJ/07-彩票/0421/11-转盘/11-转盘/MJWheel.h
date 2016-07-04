//
//  MJWheel.h
//  11-转盘
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  大转盘

#import <UIKit/UIKit.h>

@interface MJWheel : UIView
+ (instancetype)wheel;

- (void)startRotating;
- (void)stopRotating;
@end
