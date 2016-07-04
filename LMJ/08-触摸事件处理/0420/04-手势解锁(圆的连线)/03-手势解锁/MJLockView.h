//
//  MJLockView.h
//  03-手势解锁
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJLockView;

@protocol MJLockViewDelegate <NSObject>

@optional
- (void)lockView:(MJLockView *)lockView didFinishPath:(NSString *)path;

@end

@interface MJLockView : UIView
@property (nonatomic, weak) IBOutlet id<MJLockViewDelegate> delegate;
@end
