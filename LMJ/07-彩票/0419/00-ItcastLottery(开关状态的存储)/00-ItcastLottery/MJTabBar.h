//
//  MJTabBar.h
//  00-ItcastLottery
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJTabBar;

@protocol MJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(MJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end

@interface MJTabBar : UIView
@property (nonatomic, weak) id<MJTabBarDelegate> delegate;

/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;
@end
