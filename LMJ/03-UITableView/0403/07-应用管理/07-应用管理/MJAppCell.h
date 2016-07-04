//
//  MJAppCell.h
//  07-应用管理
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJApp, MJAppCell;

@protocol MJAppCellDelegate <NSObject>
@optional
- (void)appCellDidClickedDownloadBtn:(MJAppCell *)cell;
@end

@interface MJAppCell : UITableViewCell
@property (nonatomic, strong) MJApp *app;

@property (nonatomic, weak) id<MJAppCellDelegate> delegate;

@end
