//
//  MJWheelButton.m
//  11-转盘
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJWheelButton.h"

@implementation MJWheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
