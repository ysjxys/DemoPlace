//
//  MJFlagView.m
//  03-PickerView03-选择国旗
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJFlagView.h"
#import "MJFlag.h"

@interface MJFlagView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation MJFlagView
+ (instancetype)flagViewWithResuingView:(UIView *)resuingView
{
    if (resuingView == nil) {
        return [[[NSBundle mainBundle] loadNibNamed:@"MJFlagView" owner:nil options:nil] lastObject];
    } else {
        return (MJFlagView *)resuingView;
    }
}

- (void)setFlag:(MJFlag *)flag
{
    _flag = flag;
    
    // 1.名称
    self.nameLabel.text = flag.name;
    
    // 2.图标
    self.iconView.image = [UIImage imageNamed:flag.icon];
}

+ (CGFloat)flagViewHeight
{
    return 44;
}
@end
