//
//  MJStatusFrame.h
//  04-微博
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//  这个模型对象专门用来存放cell内部所有的子控件的frame数据  + cell的高度
// 一个cell拥有一个MJStatusFrame模型

#import <Foundation/Foundation.h>

@class MJStatus;

@interface MJStatusFrame : NSObject
/**
 *  头像的frame
 */
@property (nonatomic, assign, readonly) CGRect iconF;
/**
 *  昵称的frame
 */
@property (nonatomic, assign, readonly) CGRect nameF;
/**
 *  会员图标的frame
 */
@property (nonatomic, assign, readonly) CGRect vipF;
/**
 *  正文的frame
 */
@property (nonatomic, assign, readonly) CGRect textF;
/**
 *  配图的frame
 */
@property (nonatomic, assign, readonly) CGRect pictureF;

/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) MJStatus *status;
@end
