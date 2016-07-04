//
//  ProvinceView.m
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ProvinceView.h"
#define Height 30

@interface ProvinceView()
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation ProvinceView

- (void)setName:(NSString *)name{
    _name = name;
    self.nameLabel.text = name;
}

+ (instancetype)provinceViewWithCirculateView:(UIView *)view{
    if (view == nil) {
        ProvinceView *pv = [[ProvinceView alloc]initWithFrame:CGRectMake(0, 0, 160, Height)];
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, Height)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        pv.nameLabel = nameLabel;
        [pv addSubview:nameLabel];
        return pv;
    }
    return (ProvinceView *)view;
}


+ (CGFloat)viewHeight{
    return Height;
}

@end
