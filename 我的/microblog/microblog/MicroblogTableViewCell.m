//
//  MicroblogTableViewCell.m
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MicroblogTableViewCell.h"
#import "CellFrame.h"
#import "StatusData.h"


@interface MicroblogTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *vipView;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIImageView *pictuureView;

@end

@implementation MicroblogTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UIImageView *vipView = [[UIImageView alloc]init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        self.vipView.image = [UIImage imageNamed:@"vip"];
        
        UIImageView *pictuureView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictuureView];
        self.pictuureView = pictuureView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:nameLabel];
        nameLabel.font = NameFont;
        self.nameLabel = nameLabel;
        
        UILabel *statusLabel = [[UILabel alloc]init];
        [self.contentView addSubview:statusLabel];
        statusLabel.numberOfLines = 0;
        statusLabel.font = TextFont;
        self.statusLabel = statusLabel;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    NSString *ID = @"cell";
    MicroblogTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if(cell == nil){
        cell = [[MicroblogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

//构造方法
- (void)setCellFrame:(CellFrame *)cellFrame{
    _cellFrame = cellFrame;
    [self settingFrame];
    [self settingData];
}

- (void)settingData{
    StatusData *statusData = self.cellFrame.statusData;
    
    self.iconView.image = [UIImage imageNamed:statusData.icon];
    self.nameLabel.text = statusData.name;
    self.statusLabel.text = statusData.text;
    
    if (statusData.vip) {
        self.nameLabel.textColor = [UIColor redColor];
        self.vipView.hidden = NO;
    }else{
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    if (statusData.picture) {
        self.pictuureView.hidden = NO;
        self.pictuureView.image = [UIImage imageNamed:statusData.picture];
    }else{
        self.pictuureView.hidden = YES;
    }
}

- (void)settingFrame{
    self.iconView.frame = self.cellFrame.iconF;
    self.nameLabel.frame = self.cellFrame.nameF;
    self.vipView.frame = self.cellFrame.vipF;
    self.statusLabel.frame = self.cellFrame.textF;
    if(self.pictuureView){
        self.pictuureView.frame = self.cellFrame.pictureF;
    }
}

@end
