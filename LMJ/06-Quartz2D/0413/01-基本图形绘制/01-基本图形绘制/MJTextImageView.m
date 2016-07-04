//
//  MJTextImageView.m
//  01-基本图形绘制
//
//  Created by apple on 14-4-13.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTextImageView.h"

@implementation MJTextImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    drawImage();
}

void drawImage()
{
    // 1.取得图片
    UIImage *image = [UIImage imageNamed:@"me"];
    
    // 2.画
//    [image drawAtPoint:CGPointMake(50, 50)];
//    [image drawInRect:CGRectMake(0, 0, 150, 150)];
    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
    
    // 3.画文字
    NSString *str = @"为xxx所画";
    [str drawInRect:CGRectMake(0, 180, 100, 30) withAttributes:nil];
}

/**
 *  画文字
 */
void drawText()
{
    // 1.获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2.画矩形
    CGRect cubeRect = CGRectMake(50, 50, 100, 100);
    CGContextAddRect(ctx, cubeRect);
    // 3.显示所绘制的东西
    CGContextFillPath(ctx);
    
    
    
    // 4.画文字
    NSString *str = @"哈哈哈哈Good morning hello hi hi hi hi";
    //    [str drawAtPoint:CGPointZero withAttributes:nil];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // NSForegroundColorAttributeName : 文字颜色
    // NSFontAttributeName : 字体
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    [str drawInRect:cubeRect withAttributes:attrs];
}

@end
