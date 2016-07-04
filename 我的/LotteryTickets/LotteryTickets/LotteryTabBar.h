//
//  LotteryTabBar.h
//  LotteryTickets
//
//  Created by ysj on 15/7/15.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LotteryTabBar;

@protocol LotteryTabBarDelegate <NSObject>
@optional
- (void)tabBar:(LotteryTabBar *)tabBar didSelectedFromTag:(int)from to:(int)to;
@end


@interface LotteryTabBar : UIView<UITabBarDelegate>

@property (nonatomic, weak) id<LotteryTabBarDelegate> tabBarDelegate;

- (void)addBtnToTabBarWithImgName:(NSString *)imgName SelImgName:(NSString *)selImgName;
@end
