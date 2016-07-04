//
//  SingleUIButton.h
//  ximalaya
//
//  Created by ysj on 15/6/9.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonData,SingleUIButton;

@protocol SingleUIButtonDelegate <NSObject>
@optional
- (void) singleBtnClick:(SingleUIButton *)btn;
@end

@interface SingleUIButton :UIButton

@property (nonatomic, strong) ButtonData *btnData;
@property (nonatomic, weak) id<SingleUIButtonDelegate> delegate;

+ (instancetype)singleBtnWithBtnData:(ButtonData *)btnData;

@end
