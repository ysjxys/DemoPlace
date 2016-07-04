//
//  TelephoneNumCellTableViewCell.m
//  TelephoneNote
//
//  Created by ysj on 15/7/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "TelephoneNumCellTableViewCell.h"
#import "Record.h"

@interface TelephoneNumCellTableViewCell()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *telephoneLabel;
@end

@implementation TelephoneNumCellTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    NSString *ID = @"cell";
    TelephoneNumCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TelephoneNumCellTableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *nameLabel = [[UILabel alloc]init];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        
        UILabel *telephoneLabel = [[UILabel alloc]init];
        self.telephoneLabel = telephoneLabel;
        [self addSubview:telephoneLabel];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor blackColor];
        lineView.alpha = 0.2;
        lineView.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
        [self addSubview:lineView];
    }
    return self;
}

- (void)setRecord:(Record *)record{
    _record = record;
    [self setCellData];
    [self setCellFrame];
}

- (void)setCellData{
    self.nameLabel.text = _record.name;
    self.telephoneLabel.text = _record.telephoneNum;
}

- (void)setCellFrame{
    self.nameLabel.frame = CGRectMake(20, 0, 100, self.frame.size.height);
    self.telephoneLabel.frame = CGRectMake(160, 0, 130, self.frame.size.height);
}

@end
