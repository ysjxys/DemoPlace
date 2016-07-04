//
//  ProvinceView.h
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Province;
@interface ProvinceView : UIView


@property (nonatomic, copy) NSString *name;

+ (instancetype)provinceViewWithCirculateView:(UIView *)view;
+ (CGFloat)viewHeight;

@end
