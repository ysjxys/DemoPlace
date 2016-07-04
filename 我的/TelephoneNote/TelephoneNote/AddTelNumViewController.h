//
//  AddTelNumViewController.h
//  TelephoneNote
//
//  Created by ysj on 15/7/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Record;

@protocol AddTelNumViewControllerDelegate <NSObject>
@optional
- (void)addNewTelephoneNum:(Record *)record;
@end

@interface AddTelNumViewController : UIViewController

@property (nonatomic, weak) id<AddTelNumViewControllerDelegate> delegate;

@end
