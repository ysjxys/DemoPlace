//
//  ViewController.m
//  Quartz2D
//
//  Created by ysj on 15/7/14.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "LineView.h"
#import "LogoImageView.h"
#import "UIImage+LogoImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self testLineView];
//    [self testLogoImageView];
//    [self testLogoImage];
//    [self testClipsImage];
    [self testScreenClisp];
}

- (void)saveImage:(UIImage *)image{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"new.png"];
    NSLog(@"%@",path);
    [imageData writeToFile:path atomically:YES];
}

- (void)click{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat x = self.view.frame.size.width * 0.5 * 0.5;
        CGFloat y = self.view.frame.size.height * 0.5 * 0.5;
        CGFloat width = self.view.frame.size.width * 0.5;
        CGFloat height = self.view.frame.size.height * 0.5;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        UIImage *newImage = [UIImage imageClipScreen:self.view];
        imageView.image = newImage;
        [self.view addSubview:imageView];
        [self saveImage:newImage];
    });
}


- (void)testScreenClisp{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 50, 100, 50);
    [btn setTitle:@"截图" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)testClipsImage{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 181)];
//    imageView.backgroundColor = [UIColor blackColor];
    UIImage *newImage = [UIImage imageCircleWithName:@"scene" boardWidth:5 boardColor:[UIColor blueColor]];
    imageView.image = newImage;
    [self.view addSubview:imageView];
}


- (void)testLogoImage{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 181)];
    UIImage *newImage = [UIImage imageLogoWithBG:@"scene" logo:@"me"];
    imageView.image = newImage;
    [self.view addSubview:imageView];
    [self saveImage:newImage];
}

- (void)testLogoImageView{
    LogoImageView *logo = [[LogoImageView alloc]initWithFrame:CGRectMake(50, 100, 220, 220)];
    logo.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:1 alpha:0.3];
    [self.view addSubview:logo];
}


- (void)testLineView{
    LineView *lineView = [[LineView alloc]initWithFrame:CGRectMake(50, 100, 220, 220)];
    lineView.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:1 alpha:0.3];
    [self.view addSubview:lineView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
