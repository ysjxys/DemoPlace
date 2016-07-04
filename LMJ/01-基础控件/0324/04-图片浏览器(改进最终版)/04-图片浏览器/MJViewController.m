//
//  MJViewController.m
//  04-图片浏览器
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// strong : 一般对象
// weak : UI控件

#define MJIconKey @"icon"
#define MJDescKey @"desc"

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

// 图片数据集合
@property (nonatomic, strong) NSArray *imageData;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 默认显示index为0对应的数据
    [self changeData];
}

- (NSArray *)imageData
{
    if (_imageData == nil) { // 从未初始化
        // 初始化数据
        // File : 全路径
        // NSBundle : 一个NSBundle代表一个文件夹

        // 利用mainBundle就可以访问软件资源包中的任何资源
        NSBundle *bundle = [NSBundle mainBundle];
        
        //  获得imageData.plist的全路径
        NSString *path = [bundle pathForResource:@"imageData" ofType:@"plist"];
        
        _imageData = [NSArray arrayWithContentsOfFile:path];
    }
    return _imageData;
}

#pragma mark 改变数据
- (void)changeData
{
    // 1.改变数据
    self.noLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, self.imageData.count];
    
    // 2.取出index对应的字典数据
    NSDictionary *imageDict = self.imageData[self.index];
    
    // 3.设置图片
    self.iconView.image = [UIImage imageNamed:imageDict[MJIconKey]];
    
    // 4.设置描述
    self.descLabel.text = imageDict[MJDescKey];
    
    // 5.改变按钮状态
    self.previousBtn.enabled = (self.index != 0);
    self.nextBtn.enabled = (self.index != self.imageData.count - 1);
}

#pragma mark 上一张
- (IBAction)previous {
    // 1.减小索引
    self.index--;
    
    // 2.改变数据
    [self changeData];
}

#pragma mark 下一张
- (IBAction)next {
    // 1.增加索引
    self.index++;
    
    // 2.根据索引显示对应的内容
    [self changeData];
}
@end
