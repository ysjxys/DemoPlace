//
//  SingleUIButton.m
//  ximalaya
//
//  Created by ysj on 15/6/9.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SingleUIButton.h"
#import "ButtonData.h"

@interface SingleUIButton()

@end

@implementation SingleUIButton


+ (instancetype)singleBtnWithBtnData:(ButtonData *)btnData{
    SingleUIButton *btn = [[SingleUIButton alloc]initWithFrame:CGRectMake(0, 0, 145, 145)];
    btn.btnData = btnData;
    [btn setImage:[UIImage imageNamed:btnData.imgName] forState:UIControlStateNormal];
    [btn addTarget:nil action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnClick:(SingleUIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(singleBtnClick:)]) {
        [self.delegate singleBtnClick:self];
    }
}

@end
