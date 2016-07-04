//
//  CombineViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "CombineViewController.h"

#define titleChooseViewHeight 60

@interface CombineViewController()
@property(nonatomic, strong) UIImageView *titleArrow;
@property(nonatomic, strong) UIView *titleChooseView;

@end
@implementation CombineViewController

- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor yellowColor];
    [self initNavigationItems];
}

- (void)initNavigationItems{
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(80, 0, 160,navHeight)];
    
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelW = titleView.bounds.size.width;
    CGFloat labelH = titleView.bounds.size.height;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    titleLabel.text = @"全部彩种";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    UIImage *img = [UIImage imageNamed:@"YellowDownArrow"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    self.titleArrow = imgView;
    CGFloat imgViewX = 120;
    CGFloat imgViewY = (navHeight - img.size.height) * 0.5;
    CGFloat imgViewW = img.size.width;
    CGFloat imgViewH = img.size.height;
    imgView.frame = CGRectMake(imgViewX, imgViewY, imgViewW, imgViewH);
    
    [titleView addSubview:imgView];
    [titleView addSubview:titleLabel];
    
    self.navigationItem.titleView = titleView;
    UITapGestureRecognizer *titleTGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleViewClicked)];
    [titleView addGestureRecognizer:titleTGR];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavInfoFlat"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClicked)];
    
//    titleView.backgroundColor = [UIColor blackColor];
    
    CGFloat chooseH = titleChooseViewHeight;
    CGFloat chooseW = 160;
    CGFloat chooseX = 80;
    CGFloat chooseY = -titleChooseViewHeight;
    UIView *titleChooseView = [[UIView alloc]initWithFrame:CGRectMake(chooseX, chooseY, chooseW, chooseH)];
    titleChooseView.backgroundColor = [UIColor purpleColor];
    titleChooseView.hidden = YES;
    [self.view addSubview:titleChooseView];
    self.titleChooseView = titleChooseView;
}

- (void)titleViewClicked{
    BOOL isWillAppear = self.titleChooseView.frame.origin.y == 0 ? NO : YES;
    if (isWillAppear) {
        self.titleChooseView.hidden = NO;
    }
    self.titleArrow.transform = isWillAppear ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformMakeRotation(0);
    [UIView animateWithDuration:0.25 animations:^{
        self.titleChooseView.frame = isWillAppear ? CGRectMake(80, 0, 160, 60) :CGRectMake(80, -titleChooseViewHeight, 160, 60);
    } completion:^(BOOL finished) {
        if (self.titleChooseView.frame.origin.y < 0) {
            self.titleChooseView.hidden = YES;
        }
    }];
}


- (void)rightBarBtnClicked{
//    InfomationViewController *infoVC = [[InfomationViewController alloc]init];
//    infoVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:infoVC animated:YES];
}

@end
