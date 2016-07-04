//
//  MJViewController.m
//  03-图片水印
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
    
    // 1.返回水印图片
    UIImage *newImage = [UIImage waterImageWithBg:@"scene" logo:@"logo"];
    
    // 2.显示图片
    self.iconView.image = newImage;
}

- (void)testWater
{
    UIImage *bgImage = [UIImage imageNamed:@"scene"];
    
    // 上小文 : 基于位图(bitmap) ,  所有的东西需要绘制到一张新的图片上去
    
    // 1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    // size : 新图片的尺寸
    // opaque : YES : 不透明,  NO : 透明
    // 这行代码过后.就相当于常见一张新的bitmap,也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 2.画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画右下角的水印
    UIImage *waterImage = [UIImage imageNamed:@"logo"];
    CGFloat scale = 0.2;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 4.从上下文中取得制作完毕的UIImage对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    
    // 6.显示到UIImageView
    self.iconView.image = newImage;
    
    // 7.将image对象压缩为PNG格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage);
    //    UIImageJPEGRepresentation(<#UIImage *image#>, <#CGFloat compressionQuality#>)
    
    // 8.写入文件
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
}
@end
