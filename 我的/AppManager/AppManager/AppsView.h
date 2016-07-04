//
//  AppsView.h
//  AppManager
//
//  Created by ysj on 15/6/3.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppsData,AppsView;
@protocol AppsViewDelegate <NSObject>

- (void)appsClick:(AppsView *)appsView;

@end

@interface AppsView : UIView

@property (nonatomic, strong) AppsData *appsData;
@property (nonatomic, weak) id<AppsViewDelegate> delegate;

+ (instancetype)appsView;

- (instancetype)initWithAppsData:(AppsData *)appsData;
+ (instancetype)appsViewWithAppsData:(AppsData *)appsData;

@end


