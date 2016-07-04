//
//  MJViewController.m
//  01-PickerView01-点菜系统
//
//  Created by apple on 14-4-7.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)randomFood;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;
@property (nonatomic, strong) NSArray *foods;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化
//    self.fruitLabel.text = self.foods[0][0];
//    self.mainLabel.text = self.foods[1][0];
//    self.drinkLabel.text = self.foods[2][0];
//    [self pickerView:nil didSelectRow:0 inComponent:0];
//    [self pickerView:nil didSelectRow:0 inComponent:1];
//    [self pickerView:nil didSelectRow:0 inComponent:2];
    for (int component = 0; component < self.foods.count; component++) {
        [self pickerView:nil didSelectRow:0 inComponent:component];
    }
}

- (NSArray *)foods
{
    if (_foods == nil) {
        // _foods数组中装着3个数组
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
    }
    return _foods;
}

#pragma mark - 数据源方法
/**
 *  一共有多少列
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

/**
 *  第component列显示多少行
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *subfoods = self.foods[component];
    return subfoods.count;
}

#pragma mark - 代理方法
/**
 *  第component列的第row行显示什么文字
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foods[component][row];
}

/**
 *  选中了第component列的第row行
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 水果
        self.fruitLabel.text = self.foods[component][row];
    } else if (component == 1) { // 主菜
        self.mainLabel.text = self.foods[component][row];
    } else if (component == 2) { // 饮料
        self.drinkLabel.text = self.foods[component][row];
    }
}

/**
 *  随机选中某一种食物
 */
- (IBAction)randomFood {
    for (int component = 0; component < self.foods.count; component++) {
        // 第component列数组的总长度
        int count = [self.foods[component] count];
        // 之前的行号
        int oldRow = [self.pickerView selectedRowInComponent:component];
        // 第几行(默认新的行号跟旧的行号一样)
        int row = oldRow;
//        arc4random_uniform(count)
        
        // 保证行数跟上一次不一样
        while (row == oldRow) {
            row = arc4random()%count;
        }
        
        // 让pickerView主动选中第compoent列的第row行
        [self.pickerView selectRow:row inComponent:component animated:YES];
        
        // 设置label的文字
        [self pickerView:nil didSelectRow:row inComponent:component];
    }
//    [self.pickerView selectRow:arc4random()%[self.foods[0] count] inComponent:0 animated:YES];
//    [self.pickerView selectRow:arc4random()%[self.foods[1] count] inComponent:1 animated:YES];
//    [self.pickerView selectRow:arc4random()%[self.foods[2] count] inComponent:2 animated:YES];
}
@end
