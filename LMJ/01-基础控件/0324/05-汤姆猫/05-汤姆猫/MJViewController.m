//
//  MJViewController.m
//  05-汤姆猫
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)drink;
- (IBAction)knock;
- (IBAction)rightFoot;

/** 这是一只显示图片的猫 */
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@end

@implementation MJViewController
/** 播放动画 */
- (void)runAnimationWithCount:(int)count name:(NSString *)name
{
    if (self.tom.isAnimating) return;
    
    // 1.加载所有的动画图片
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i<count; i++) {
        // 计算文件名
        NSString *filename = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        // 加载图片
        
        // imageNamed: 有缓存(传入文件名)
//        UIImage *image = [UIImage imageNamed:filename];
        
        // imageWithContentsOfFile: 没有缓存(传入文件的全路径)
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:filename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        // 添加图片到数组中
        [images addObject:image];
    }
    self.tom.animationImages = images;
    
    // 2.设置播放次数(1次)
    self.tom.animationRepeatCount = 1;
    
    // 3.设置播放时间
    self.tom.animationDuration = images.count * 0.05;
    
    [self.tom startAnimating];
    
    // 4.动画放完1秒后清除内存
    CGFloat delay = self.tom.animationDuration + 1.0;
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
//    [self performSelector:@selector(clearCache) withObject:nil afterDelay:delay];
}

//- (void)clearCache
//{
////    self.tom.animationImages = nil;
//    
//    [self.tom setAnimationImages:nil];
//}

- (IBAction)drink {
    [self runAnimationWithCount:81 name:@"drink"];
    
//    if (self.tom.isAnimating) return;
//    
//    // 1.加载所有的动画图片
//    NSMutableArray *images = [NSMutableArray array];
//    
//    for (int i = 0; i<81; i++) {
//        // 计算文件名
//        NSString *filename = [NSString stringWithFormat:@"drink_%02d.jpg", i];
//        // 加载图片
//        UIImage *image = [UIImage imageNamed:filename];
//        // 添加图片到数组中
//        [images addObject:image];
//    }
//    self.tom.animationImages = images;
//    
//    // 2.设置播放次数(1次)
//    self.tom.animationRepeatCount = 1;
//    
//    // 3.设置播放时间
//    self.tom.animationDuration = images.count * 0.05;
//    
//    [self.tom startAnimating];
}

- (IBAction)knock {
    [self runAnimationWithCount:81 name:@"knockout"];
}

- (IBAction)rightFoot {
    [self runAnimationWithCount:30 name:@"footRight"];
}
@end
