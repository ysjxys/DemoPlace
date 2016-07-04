//
//  TelephoneNumCellTableViewCell.h
//  TelephoneNote
//
//  Created by ysj on 15/7/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Record;

@interface TelephoneNumCellTableViewCell : UITableViewCell


@property (nonatomic, strong) Record *record;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
