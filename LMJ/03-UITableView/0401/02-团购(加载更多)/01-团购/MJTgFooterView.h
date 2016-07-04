//
//  MJTgFooterView.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJViewController;

@interface MJTgFooterView : UIView

/**
 *  快速创建一个footerView对象
 */
+ (instancetype)footerView;

@property (nonatomic , strong) MJViewController *controller;

@end
