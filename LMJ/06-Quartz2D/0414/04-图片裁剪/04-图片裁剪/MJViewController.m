//
//  MJViewController.m
//  04-图片裁剪
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "UIImage+MJ.h"
@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *newImage = [UIImage circleImageWithName:@"me" borderWidth:3 borderColor:[UIColor whiteColor]];
    self.iconView.image = newImage;
    
    NSData *data = UIImagePNGRepresentation(newImage);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
}

- (void)circleTest2
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:@"me"];
    
    // 2.开启上下文
    CGFloat borderW = 2; // 圆环的宽度
    CGFloat imageW = oldImage.size.width + 2 * borderW;
    CGFloat imageH = oldImage.size.height + 2 * borderW;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [[UIColor whiteColor] set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderW;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    // 9.显示图片
    self.iconView.image = newImage;
    
    // 10.写出文件
    NSData *data = UIImagePNGRepresentation(newImage);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
}

- (void)circleTest
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:@"me"];
    
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    
    // 5.按照当前的路径形状(圆形)裁剪, 超出这个形状以外的内容都不显示
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:circleRect];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束
    UIGraphicsEndImageContext();
    
    // 9.写出文件
    NSData *data = UIImagePNGRepresentation(newImage);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
    
    // 10.显示图片
    self.iconView.image = newImage;
}

@end
