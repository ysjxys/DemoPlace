//
//  MJViewController.m
//  03-transform
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)leftRotate;
- (IBAction)up;
- (IBAction)big;
@end

@implementation MJViewController

- (IBAction)leftRotate {
    // 1.取得头像按钮
    UIButton *head = (UIButton *)[self.view viewWithTag:10];
    
    // 2.向左旋转45°
    // 45  180
    // 角度是正数:顺时针, 角度是负数:逆时针
//    head.transform = CGAffineTransformMakeRotation(-M_PI_4);
    head.transform = CGAffineTransformRotate(head.transform, M_PI_4);
}

- (IBAction)up {
    // 1.取得头像按钮
    UIButton *head = (UIButton *)[self.view viewWithTag:10];
    
    // 2.每次向上移动100的距离
//    head.transform = CGAffineTransformMakeTranslation(0, -100);
    head.transform = CGAffineTransformTranslate(head.transform, 0, -100);
}

- (IBAction)big {
    // 1.取得头像按钮
    UIButton *head = (UIButton *)[self.view viewWithTag:10];
    
    // 2.增大
//    head.transform = CGAffineTransformMakeScale(1.5, 1.5);
    head.transform = CGAffineTransformScale(head.transform, 1.5, 1.5);
}
@end
