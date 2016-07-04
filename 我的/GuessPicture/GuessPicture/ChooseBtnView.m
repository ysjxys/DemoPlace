//
//  AnswerBtnView.m
//  GuessPicture
//
//  Created by ysj on 15/6/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ChooseBtnView.h"

@implementation ChooseBtnView


+ (instancetype) chooseAnswerBtnWithString:(NSString *)word{
    ChooseBtnView *answerBtn = [[ChooseBtnView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
    [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighed"] forState:UIControlStateHighlighted];
    [answerBtn basicSettingWithWord:word];
//    [answerBtn setTitle:word forState:UIControlStateNormal];
//    [answerBtn setTitle:word forState:UIControlStateHighlighted];
//    [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    return answerBtn;
}

+ (instancetype) chooseOptionBtnWithString:(NSString *)word{
    ChooseBtnView *optionBtn = [[ChooseBtnView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
    [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighed"] forState:UIControlStateHighlighted];
    [optionBtn basicSettingWithWord:word];
    return optionBtn;
}

- (void) basicSettingWithWord:(NSString *)word{
    [self setTitle:word forState:UIControlStateNormal];
    [self setTitle:word forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

@end
