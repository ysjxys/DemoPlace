//
//  MicroblogTableViewCell.h
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellFrame;


@interface MicroblogTableViewCell : UITableViewCell

@property (nonatomic,strong) CellFrame *cellFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
