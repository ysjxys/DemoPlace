//
//  UIImage+Extension.m
//  LotteryTickets
//
//  Created by ysj on 15/7/18.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)reSizeableExtensionImage:(NSString *)imageName{
    UIImage *img = [UIImage imageNamed:imageName];
    CGFloat w = img.size.width * 0.5;
    CGFloat h = img.size.height * 0.5;
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
