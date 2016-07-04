//
//  LotteryTabBarController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/15.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LotteryTabBarController.h"
#import "LotteryTabBar.h"
#import "LotteryTabBarButton.h"

@interface LotteryTabBarController()<LotteryTabBarDelegate>
@property (nonatomic, strong) LotteryTabBar *tabbar;
@end
@implementation LotteryTabBarController



- (void)viewDidLoad{
    [super viewDidLoad];
    LotteryTabBar *tabbar = [[LotteryTabBar alloc]init];
    tabbar.frame = self.tabBar.bounds;
    tabbar.tabBarDelegate = self;
    
    self.tabbar = tabbar;
    
    
    int count = 5;
    for (int i = 0; i < count; i++) {
        NSString *imageNormal = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *imageSel = [NSString stringWithFormat:@"%@Sel",imageNormal];
        [tabbar addBtnToTabBarWithImgName:imageNormal SelImgName:imageSel];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tabBar addSubview:self.tabbar];
}


- (void)tabBar:(LotteryTabBar *)tabBar didSelectedFromTag:(int)from to:(int)to{
    self.selectedIndex = to;
}
@end
