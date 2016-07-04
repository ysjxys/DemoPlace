//
//  MJViewController.m
//  10-拖拽(Pan)
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIView *purpleView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.purpleView addGestureRecognizer:pan];
}

- (void)panView:(UIPanGestureRecognizer *)pan
{
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan: // 开始触发手势
            
            break;
            
        case UIGestureRecognizerStateEnded: // 手势结束
            
            break;
            
        default:
            break;
    }
    
    // 1.在view上面挪动的距离
    CGPoint translation = [pan translationInView:pan.view];
    CGPoint center = pan.view.center;
    center.x += translation.x;
    center.y += translation.y;
    pan.view.center = center;
    
    // 2.清空移动的距离
    [pan setTranslation:CGPointZero inView:pan.view];
}

@end
