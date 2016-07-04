//
//  ViewController.m
//  UITest
//
//  Created by ysj on 15/5/30.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#define ImagePlistName @"imageData"
#define ImagePlistType @"plist"
#define ImageNameKey @"imageName"
#define ImageDescKey @"imageDesc"

@interface ViewController ()

@property(nonatomic, retain) NSArray *imageArr;
@property(nonatomic, retain) UILabel *topLabel;
@property(nonatomic, retain) UILabel *buttonLabel;
@property(nonatomic, retain) UIButton *btnLeft;
@property(nonatomic, retain) UIButton *btnRight;
@property(nonatomic, assign) int index;
@property(nonatomic, retain) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    self.index = -1;
    [self rightClick];
}

- (void)leftClick{
    self.index--;
    [self btnClick];
}

- (void)rightClick{
    self.index++;
    [self btnClick];
}

- (void)btnClick{
    NSDictionary *imageDict = self.imageArr[self.index];
    self.imageView.image = [UIImage imageNamed:imageDict[ImageNameKey]];
    self.topLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.imageArr.count];
    self.buttonLabel.text = imageDict[ImageDescKey];
    self.btnLeft.enabled = self.index <= 0 ? NO:YES;
    self.btnRight.enabled = self.index >= self.imageArr.count - 1 ? NO:YES;
}

- (void)initView{
    
    self.topLabel = [[UILabel alloc]init];
    [self.view addSubview:self.topLabel];
    self.topLabel.frame = CGRectMake(110, 50, 100, 40);
//    self.topLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.imageArr.count];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.backgroundColor = [UIColor clearColor];
    
    
    self.buttonLabel = [[UILabel alloc]init];
    [self.view addSubview:self.buttonLabel];
    self.buttonLabel.frame = CGRectMake(110, 380, 100, 40);
//    self.buttonLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.imageArr.count];
    self.buttonLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonLabel.backgroundColor = [UIColor clearColor];
    
    
    self.btnLeft = [[UIButton alloc]init];
    [self.view addSubview:self.btnLeft];
    self.btnLeft.frame = CGRectMake(15, 200, 40, 40);
    [self.btnLeft setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [self.btnLeft setBackgroundImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateDisabled];
    [self.btnLeft setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [self.btnLeft setEnabled:NO];
    [self.btnLeft setTag:1];
    [self.btnLeft addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.btnRight = [[UIButton alloc]init];
    [self.view addSubview:self.btnRight];
    self.btnRight.frame = CGRectMake(265, 200, 40, 40);
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"right_disable"] forState:UIControlStateDisabled];
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.btnRight setTag:2];
    [self.btnRight addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.imageView = [[UIImageView alloc]init];
    [self.view addSubview:self.imageView];
    self.imageView.frame = CGRectMake(65, 110, 190, 210);
//    self.imageView.image = self.imageArr[self.index];
}

-(NSArray *)imageArr{
    if (_imageArr == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *plistPath = [bundle pathForResource:ImagePlistName ofType:ImagePlistType];
        _imageArr = [NSArray arrayWithContentsOfFile:plistPath];
    }
    return _imageArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
