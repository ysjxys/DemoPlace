//
//  UIImage+LogoImage.h
//  Quartz2D
//
//  Created by ysj on 15/7/14.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LogoImage)


+ (instancetype)imageLogoWithBG:(NSString *)imageName logo:(NSString *)logoImageName;
+ (instancetype)imageCircleWithName:(NSString *)imageName boardWidth:(CGFloat)boardWidth boardColor:(UIColor *)boardColor;
+ (instancetype)imageClipScreen:(UIView *)view;
@end
