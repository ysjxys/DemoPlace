//
//  CellFrame.h
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:14]
@class StatusData;

@interface CellFrame : NSObject

@property (nonatomic, strong) StatusData *statusData;
@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect pictureF;
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
