//
//  MJHeaderView.m
//  03-QQ好友列表
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJHeaderView.h"

/**
 某个控件出不来:
 1.frame的尺寸和位置对不对
 
 2.hidden是否为YES
 
 3.有没有添加到父控件中
 
 4.alpha 是否 < 0.01
 
 5.被其他控件挡住了
 
 6.父控件的前面5个情况
 */

@interface MJHeaderView()
@property (nonatomic, weak) UILabel *countView;
@property (nonatomic, weak) UIButton *nameView;
@end

@implementation MJHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"header";
    MJHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[MJHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

/**
 *  在这个初始化方法中,MJHeaderView的frame\bounds没有值
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 1.添加按钮
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        nameView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        // 2.添加好友数
        UILabel *countView = [[UILabel alloc] init];
        countView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:countView];
        self.countView = countView;
    }
    return self;
}

/**
 *  当一个控件的frame发生改变的时候就会调用
 *
 *  一般在这里布局内部的子控件(设置子控件的frame)
 */
- (void)layoutSubviews
{
#warning 一定要调用super的方法
    [super layoutSubviews];
    
    // 1.设置按钮的frame
    self.nameView.frame = self.bounds;
    
    // 2.设置好友数的frame
    CGFloat countY = 0;
    CGFloat countH = self.frame.size.height;
    CGFloat countW = 150;
    CGFloat countX = self.frame.size.width - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
}

@end
