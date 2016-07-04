//
//  MJImageView.h
//  02-模仿UIImageView
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJImageView : UIView
// 自定义的属性一定要重写setter方法,并在setter方法重绘
@property (nonatomic, strong) UIImage *image;
@end
