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
    
    [self changeData];
}

- (NSArray *)imageData
{
    if (_imageData == nil) { // 从未初始化
        // 初始化数据
        NSMutableDictionary *image1 = [NSMutableDictionary dictionary];
        image1[MJIconKey] = @"biaoqingdi";
        image1[MJDescKey] = @"在他面前，其他神马表情都弱爆了！";
        
        NSMutableDictionary *image2 = [NSMutableDictionary dictionary];
        image2[MJIconKey] = @"wangba";
        image2[MJDescKey] = @"哥们为什么选八号呢";
        
        NSMutableDictionary *image3 = [NSMutableDictionary dictionary];
        image3[MJIconKey] = @"bingli";
        image3[MJDescKey] = @"这也忒狠了";
        
        NSMutableDictionary *image4 = [NSMutableDictionary dictionary];
        image4[MJIconKey] = @"chiniupa";
        image4[MJDescKey] = @"chiniupa";
        
        NSMutableDictionary *image5 = [NSMutableDictionary dictionary];
        image5[MJIconKey] = @"danteng";
        image5[MJDescKey] = @"亲，你能改下你的网名么？哈哈";
        
//        NSMutableDictionary *image6 = [NSMutableDictionary dictionary];
//        image6[MJIconKey] = @"chiniupa";
//        image6[MJDescKey] = @"新增的数据哈哈哈哈哈哈";
        
        _imageData = @[image1, image2, image3, image4, image5];
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
    
    // 2.改变按钮状态
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
    self.index++; //0
    
    // 2.根据索引显示对应的内容
    [self changeData];
}
@end
