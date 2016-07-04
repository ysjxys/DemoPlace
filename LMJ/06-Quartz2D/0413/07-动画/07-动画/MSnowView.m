//
//  MSnowView.m
//  07-动画
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MSnowView.h"

@interface MSnowView()
@property (nonatomic, assign) CGFloat snowY;
@end

@implementation MSnowView

- (void)awakeFromNib
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    //    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
}

- (void)drawRect:(CGRect)rect
{
    self.snowY+=5;
    
    if (self.snowY >= rect.size.height) {
        self.snowY = -100;
    }
    
    UIImage *image = [UIImage imageNamed:@"snow.jpg"];
    [image drawAtPoint:CGPointMake(0, self.snowY)];
}


@end
