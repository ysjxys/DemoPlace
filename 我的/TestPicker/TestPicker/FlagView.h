//
//  FlagView.h
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flag;

@interface FlagView : UIView

@property (nonatomic , strong)  Flag *flagViewData;

+ (instancetype)flagViewWithCirculateView:(UIView *)view;
+ (CGFloat)viewHeight;

@end
