//
//  AnswerBtnView.h
//  GuessPicture
//
//  Created by ysj on 15/6/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseBtnView : UIButton

+ (instancetype) chooseAnswerBtnWithString:(NSString *)word;
+ (instancetype) chooseOptionBtnWithString:(NSString *)word;


@end
