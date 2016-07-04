//
//  UIImage+MJ.h
//  03-图片水印
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MJ)
/**
 *  打水印
 *
 *  @param bg   背景图片
 *  @param logo 右下角的水印图片
 */
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo;
@end
