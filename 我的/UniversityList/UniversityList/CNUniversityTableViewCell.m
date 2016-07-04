//
//  CNUniversityTableViewCell.m
//  UniversityList
//
//  Created by ysj on 15/8/23.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "CNUniversityTableViewCell.h"
#import "CNUniversity.h"

@interface CNUniversityTableViewCell()
@property (nonatomic, strong) UIImageView *badgeImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *attributeView;
@property (nonatomic, strong) UIImageView *placeIconImageView;
@property (nonatomic, strong) UILabel *placeLabel;
@property (nonatomic, strong) UIImageView *kindIconImageView;
@property (nonatomic, strong) UILabel *kindLabel;
@property (nonatomic, strong) UIImageView *is211IconImageView;
@property (nonatomic, strong) UILabel *is211Label;
@property (nonatomic, strong) UIImageView *is985IconImageView;
@property (nonatomic, strong) UILabel *is985Label;

@end

@implementation CNUniversityTableViewCell



+ (instancetype)universityWithTableView:(UITableView *)tableView{
    NSString *ID = @"CNU";
    CNUniversityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CNUniversityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *badgeImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:badgeImageView];
        self.badgeImageView = badgeImageView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UIView *attributeView = [[UIView alloc]init];
        [self.contentView addSubview:attributeView];
        self.attributeView = attributeView;
        
        UIImageView *placeIconImageView = [[UIImageView alloc]init];
        self.placeIconImageView = placeIconImageView;
        [attributeView addSubview:placeIconImageView];
        
        UILabel *placeLabel = [[UILabel alloc]init];
        self.placeLabel = placeLabel;
        [attributeView addSubview:placeLabel];
        
        UIImageView *kindIconImageView = [[UIImageView alloc]init];
        self.kindIconImageView = kindIconImageView;
        [attributeView addSubview:kindIconImageView];
        
        UILabel *kindLabel = [[UILabel alloc]init];
        self.kindLabel = kindLabel;
        [attributeView addSubview:kindLabel];
        
        UIImageView *is211IconImageView = [[UIImageView alloc]init];
        self.is211IconImageView = is211IconImageView;
        [attributeView addSubview:is211IconImageView];
        
        UILabel *is211Label = [[UILabel alloc]init];
        self.is211Label = is211Label;
        [attributeView addSubview:is211Label];
        
        UIImageView *is985IconImageView = [[UIImageView alloc]init];
        self.is985IconImageView = is985IconImageView;
        [attributeView addSubview:is985IconImageView];
        
        UILabel *is985Label = [[UILabel alloc]init];
        self.is985Label = is985Label;
        [attributeView addSubview:is985Label];
    }
    return self;
}


- (void)setCnu:(CNUniversity *)cnu{
    self.cnu = cnu;
    [self settingData];
    [self settingFrame];
}

- (void)settingData{
    self.badgeImageView.image = [UIImage imageNamed:self.cnu.badgeimage];
    self.nameLabel.text = self.cnu.name;
    self.placeIconImageView.image = [UIImage imageNamed:@"dot_red"];
    self.placeLabel.text = self.cnu.province;
    self.kindIconImageView.image = [UIImage imageNamed:@"dot_blue"];
    self.kindLabel.text = self.cnu.kind;
    self.is211IconImageView.image = [UIImage imageNamed:@"dot_pink"];
    self.is211Label.text = self.cnu.isUn211 == YES?@"211":@"";
    self.is985IconImageView.image = [UIImage imageNamed:@"dot_purple"];
    self.is985Label.text = self.cnu.isUn985 == YES?@"985":@"";
}

- (void)settingFrame{
    static CGFloat badgeSize = 64;
    static CGFloat distance = 5.0;
    static CGFloat iconSize = 18.0;
    static CGFloat attributeHeight = 20.0;
    static CGFloat labelWidth = 50;
    
    self.badgeImageView.frame = CGRectMake(distance, distance, badgeSize, badgeSize);
    self.nameLabel.frame = CGRectMake(badgeSize + 5, distance, 250, 40);
    self.attributeView.frame = CGRectMake(70, 42, 250, attributeHeight);
    self.placeIconImageView.frame = CGRectMake(distance, (attributeHeight - iconSize) * 0.5, iconSize, iconSize);
    self.placeLabel.frame = CGRectMake(distance * 2 + iconSize, 0, labelWidth, attributeHeight);
    self.kindIconImageView.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}





@end
