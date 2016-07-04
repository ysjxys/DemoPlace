//
//  MJTabBarButton.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTabBarButton.h"

@implementation MJTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
 *  只要覆盖了这个方法,按钮就不存在高亮状态
 *
 *  @param highlighted <#highlighted description#>
 */
- (void)setHighlighted:(BOOL)highlighted
{
//    [super setHighlighted:highlighted];
}
@end
