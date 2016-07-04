//
//  MJImageView.m
//  02-模仿UIImageView
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJImageView.h"

@implementation MJImageView

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self.image drawInRect:rect];
}

@end
