//
//  FlagView.m
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

#define ViewHeight 44

@interface FlagView()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *flagView;

@end

@implementation FlagView

- (void)setFlagViewData:(Flag *)flag{
    _flagViewData = flag;
    self.nameLabel.text = flag.name;
    self.flagView.image = [UIImage imageNamed:flag.icon];
}


+ (instancetype)flagViewWithCirculateView:(UIView *)view{
    if (view == nil) {
        FlagView *newView = [[FlagView alloc]initWithFrame:CGRectMake(0, 0, 320, ViewHeight)];
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 100, ViewHeight)];
        UIImageView *flagView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 0, 150*ViewHeight/75, ViewHeight)];
        newView.nameLabel = name;
        newView.flagView = flagView;
        [newView addSubview:name];
        [newView addSubview:flagView];
        return newView;
    }
    return (FlagView *)view;
}

+ (CGFloat)viewHeight{
    return ViewHeight;
}



@end
