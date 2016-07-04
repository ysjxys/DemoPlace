//
//  CNUniversityTableViewCell.h
//  UniversityList
//
//  Created by ysj on 15/8/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CNUniversity;

@interface CNUniversityTableViewCell : UITableViewCell

@property (nonatomic, strong) CNUniversity *cnu;

+ (instancetype)universityWithTableView:(UITableView *)tableView;

@end
