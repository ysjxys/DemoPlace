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
@end
