//
//  MJViewController.m
//  06-条纹背景
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
    
    // 1.创建一行背景图片
    CGFloat rowW = self.view.frame.size.width;
//    CGFloat rowH = 40;
    CGFloat rowH = 30;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rowW, rowH), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画矩形框
    [[UIColor redColor] set];
    CGContextAddRect(ctx, CGRectMake(0, 0, rowW, rowH));
    CGContextFillPath(ctx);
    
    // 2.画线
    [[UIColor greenColor] set];
    CGFloat lineWidth = 2;
    CGContextSetLineWidth(ctx, lineWidth);
    CGFloat dividerX = 0;
    CGFloat dividerY = rowH - lineWidth;
    CGContextMoveToPoint(ctx, dividerX, dividerY);
    CGContextAddLineToPoint(ctx, rowW - dividerX, dividerY);
    CGContextStrokePath(ctx);
    
    // 3.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    // 5.设置为背景
    self.textView.backgroundColor = [UIColor colorWithPatternImage:newImage];
}

- (void)imageBg
{
    UIImage *oldImage = [UIImage imageNamed:@"me"];
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    [oldImage drawInRect:self.view.bounds];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
