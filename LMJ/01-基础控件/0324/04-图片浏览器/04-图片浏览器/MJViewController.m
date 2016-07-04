//
//  MJViewController.m
//  04-图片浏览器
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
- (IBAction)previous;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

// 记录当前显示的是第几张图片
@property (nonatomic, assign) int index;
@end

@implementation MJViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.index = 1;
    [self previous];
}

#pragma mark 改变数据
- (void)changeData
{
    // 1.改变数据
    switch (self.index) {
        case 0:
            self.noLabel.text = @"1/5";
            self.iconView.image = [UIImage imageNamed:@"biaoqingdi"];
            self.descLabel.text = @"在他面前，其他神马表情都弱爆了！";
            break;
            
        case 1:
            self.
            noLabel.text = @"2/5";
            self.iconView.image = [UIImage imageNamed:@"wangba"];
            self.descLabel.text = @"哥们为什么选八号呢";
            break;
            
        case 2:
            self.noLabel.text = @"3/5";
            self.iconView.image = [UIImage imageNamed:@"bingli"];
            self.descLabel.text = @"这也忒狠了";
            break;
            
        case 3:
            self.noLabel.text = @"4/5";
            self.iconView.image = [UIImage imageNamed:@"chiniupa"];
            self.descLabel.text = @"这小姑娘吃个牛排比杀牛还费劲啊";
            break;
            
        case 4:
            self.noLabel.text = @"5/5";
            self.iconView.image = [UIImage imageNamed:@"danteng"];
            self.descLabel.text = @"亲，你能改下你的网名么？哈哈";
            break;
    }
    
    // 2.改变按钮状态
    self.previousBtn.enabled = (self.index != 0);
    self.nextBtn.enabled = (self.index != 4);
}

#pragma mark 上一张
- (IBAction)previous {
    // 1.减小索引
    self.index--;
    
    // 2.改变数据
    [self changeData];
    
    // 3.控制箭头按钮的状态
//    if (self.index == 0) {
//        self.previousBtn.enabled = NO;
//    } else {
//        self.previousBtn.enabled = YES;
//    }
    
    
    
//    if (self.index == 4) {
//        self.nextBtn.enabled = NO;
//    } else {
//        self.nextBtn.enabled = YES;
//    }
}

#pragma mark 下一张
- (IBAction)next {
    // 1.增加索引
    self.index++; //0
    
    // 2.根据索引显示对应的内容
    [self changeData];
}
@end
