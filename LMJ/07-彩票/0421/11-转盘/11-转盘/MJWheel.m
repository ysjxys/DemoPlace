//
//  MJWheel.m
//  11-转盘
//
//  Created by apple on 14-4-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJWheel.h"
#import "MJWheelButton.h"

@interface MJWheel()
- (IBAction)startChoose;
@property (weak, nonatomic) IBOutlet UIImageView *centerWheel;
@property (nonatomic, weak) MJWheelButton *selectedBtn;
@property (nonatomic, strong) CADisplayLink *link;
@end

@implementation MJWheel

+ (instancetype)wheel
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MJWheel" owner:nil options:nil] lastObject];
}

/**
 *  在这个方法中,取得属性才是有值的
 */
- (void)awakeFromNib
{
    // 让imageView能跟用户进行交互
    self.centerWheel.userInteractionEnabled = YES;
    
    // 加载大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *bigImageSelected = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    // 从大图片中裁剪中对应星座的图片
    CGFloat smallW = bigImage.size.width / 12  * [UIScreen mainScreen].scale;
    CGFloat smallH = bigImage.size.height * [UIScreen mainScreen].scale;
    
    // 添加12个按钮
    for (int index = 0; index < 12; index++) {
        MJWheelButton *btn = [MJWheelButton buttonWithType:UIButtonTypeCustom];
        
        CGRect smallRect = CGRectMake(index * smallW, 0, smallW, smallH);
        
        // CGImageCreateWithImageInRect只认像素
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        CGImageRef smallImageSelected = CGImageCreateWithImageInRect(bigImageSelected.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageSelected] forState:UIControlStateSelected];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        // 设置锚点和位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.centerWheel.frame.size.width * 0.5, self.centerWheel.frame.size.height * 0.5);
        
        // 设置旋转角度(绕着锚点进行旋转)
        CGFloat angle = (30 * index) / 180.0 * M_PI;
        btn.transform = CGAffineTransformMakeRotation(angle);
        
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self.centerWheel addSubview:btn];
        
        if (index == 0) {
            [self btnClick:btn];
        }
    }
}

/**
 *  监听按钮点击
 */
- (void)btnClick:(MJWheelButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

/**
 *  开始不停得旋转
 */
- (void)startRotating
{
    if (self.link) return;
    
    // 1秒内刷新60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}

- (void)stopRotating
{
    [self.link invalidate];
    self.link = nil;
}

- (void)update
{
    self.centerWheel.transform = CGAffineTransformRotate(self.centerWheel.transform, M_PI / 500);
}

/**
 *  开始选号
 */
- (IBAction)startChoose {
    [self stopRotating];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(2 * M_PI * 3);
    anim.duration = 1.5;
    // 开头和结尾比较慢,中间快
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    [self.centerWheel.layer addAnimation:anim forKey:nil];
    
    self.userInteractionEnabled = NO;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}
@end
