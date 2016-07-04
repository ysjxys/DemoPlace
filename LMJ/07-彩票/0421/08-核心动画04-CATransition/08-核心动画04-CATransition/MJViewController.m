//
//  MJViewController.m
//  08-核心动画04-CATransition
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)previous;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/**
 *  当前图片的索引
 */
@property (nonatomic, assign) int index;
@end

@implementation MJViewController

- (IBAction)previous {
    self.index--;
    if (self.index == -1) {
        self.index = 8;
    }
    
    NSString *filename = [NSString stringWithFormat:@"%d.jpg", self.index + 1];
    self.iconView.image = [UIImage imageNamed:filename];
    
    CATransition *anim = [CATransition animation];
//    anim.type = @"cube";
//    anim.subtype = kCATransitionFromLeft;
    anim.type = @"pageUnCurl";
    anim.duration = 0.5;
    [self.view.layer addAnimation:anim forKey:nil];
}

- (IBAction)next {
    self.index++;
    if (self.index == 9) {
        self.index = 0;
    }

    NSString *filename = [NSString stringWithFormat:@"%d.jpg", self.index + 1];
    self.iconView.image = [UIImage imageNamed:filename];
    
    // 转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"pageCurl";
//    anim.subtype = kCATransitionFromRight;
    anim.duration = 0.5;
    
//    anim.startProgress = 0.0;
//    
//    anim.endProgress = 0.5;
    
    [self.view.layer addAnimation:anim forKey:nil];
}
@end
