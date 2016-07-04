//
//  MJStatusCell.m
//  04-微博
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// 昵称的字体
#define MJNameFont [UIFont systemFontOfSize:14]
// 正文的字体
#define MJTextFont [UIFont systemFontOfSize:15]

#import "MJStatusCell.h"
#import "MJStatus.h"
#import "MJStatusFrame.h"

@interface MJStatusCell()
/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;
/**
 *  昵称
 */
@property (nonatomic, weak) UILabel *nameView;
/**
 *  会员图标
 */
@property (nonatomic, weak) UIImageView *vipView;
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *textView;
/**
 *  配图
 */
@property (nonatomic, weak) UIImageView *pictureView;
@end

@implementation MJStatusCell

/**
 *  构造方法(在初始化对象的时候会调用)
 *  一般在这个方法中添加需要显示的子控件
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 1.头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 2.昵称
        UILabel *nameView = [[UILabel alloc] init];
        nameView.font = MJNameFont;
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        // 3.会员图标
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        // 4.正文
        UILabel *textView = [[UILabel alloc] init];
        textView.numberOfLines = 0;
        textView.font = MJTextFont;
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        // 5.配图
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

/**
 *  在这个方法中设置子控件的frame和显示数据
 */
- (void)setStatusFrame:(MJStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.设置数据
    [self settingData];
    
    // 2.设置frame
    [self settingFrame];
}

/**
 *  设置数据
 */
- (void)settingData
{
    // 微博数据
    MJStatus *status = self.statusFrame.status;
    
    // 1.头像
    self.iconView.image = [UIImage imageNamed:status.icon];
    
    // 2.昵称
    self.nameView.text = status.name;
    
    // 3.会员图标
    if (status.vip) {
        self.vipView.hidden = NO;
        
        self.nameView.textColor = [UIColor redColor];
    } else {
        self.vipView.hidden = YES;
        
        self.nameView.textColor = [UIColor blackColor];
    }
    
    // 4.正文
    self.textView.text = status.text;
    
    // 5.配图
    if (status.picture) { // 有配图
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    } else { // 没有配图
        self.pictureView.hidden = YES;
    }
}

/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  设置frame
 */
- (void)settingFrame
{
    // 1.头像
    self.iconView.frame = self.statusFrame.iconF;
    
    // 2.昵称
    self.nameView.frame = self.statusFrame.nameF;
    
    // 3.会员图标
    self.vipView.frame = self.statusFrame.vipF;
    
    // 4.正文
    self.textView.frame = self.statusFrame.textF;
    
    // 5.配图
    if (self.statusFrame.status.picture) {// 有配图
        self.pictureView.frame = self.statusFrame.pictureF;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    MJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MJStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
@end
