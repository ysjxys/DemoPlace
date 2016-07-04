//
//  UIImage+LogoImage.m
//  Quartz2D
//
//  Created by ysj on 15/7/14.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "UIImage+LogoImage.h"

@implementation UIImage (LogoImage)


+ (instancetype)imageClipScreen:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)imageLogoWithBG:(NSString *)imageName logo:(NSString *)logoImageName{
    UIImage *bgImage = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    UIImage *logoImage = [UIImage imageNamed:logoImageName];
    CGFloat scale = 0.2;
    CGFloat margin = 10;
    CGFloat x = margin;
    CGFloat y = margin;
    CGFloat width = logoImage.size.width * scale;
    CGFloat height = logoImage.size.height * scale;
    [logoImage drawInRect:CGRectMake(x, y, width, height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (instancetype)imageCircleWithName:(NSString *)imageName boardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor{
    
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    CGFloat imageW = oldImage.size.width + 2 * boardWidth;
    CGFloat imageH = oldImage.size.height + 2 * boardWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [boardColor set];
    
    CGFloat bigRadius = (imageW < imageH ? imageW : imageH) * 0.5;
    CGFloat centX = imageW * 0.5;
    CGFloat centY = imageH * 0.5;
    CGContextAddArc(ctx, centX, centY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    
    CGFloat smallRadius = bigRadius - boardWidth;
    CGContextAddArc(ctx, centX, centY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    
    [oldImage drawInRect:CGRectMake(boardWidth, boardWidth, oldImage.size.width, oldImage.size.height)];
    NSLog(@"%f,%f",oldImage.size.width, oldImage.size.height);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
