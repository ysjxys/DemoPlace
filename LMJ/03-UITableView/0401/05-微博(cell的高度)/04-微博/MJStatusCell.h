//
//  MJStatusCell.h
//  04-微博
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJStatusFrame;

@interface MJStatusCell : UITableViewCell
@property (nonatomic, strong) MJStatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
