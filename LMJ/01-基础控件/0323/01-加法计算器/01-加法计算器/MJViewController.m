//
//  MJViewController.m
//  01-加法计算器
//
//  Created by apple on 14-3-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

// 类扩展(私有扩展)
@interface MJViewController ()
// 点击了计算按钮的时候就调用
- (IBAction)compute;

// num1控制第1个文本框
@property (nonatomic, weak) IBOutlet UITextField *num1;
// num2控制第2个文本框
@property (nonatomic, weak) IBOutlet UITextField *num2;
// sumLabel控制最右边的文本标签
@property (nonatomic, weak) IBOutlet UILabel *sumLabel;
@end

@implementation MJViewController

- (void)compute
{
    // 1.取得2个文本输入框的值
    NSString *text1 = self.num1.text;
    NSString *text2 = self.num2.text;
    
    // 2.相加
    int sum = text1.intValue + text2.intValue;
    
    // 3.将结果显示到最右边的文本标签上
    self.sumLabel.text = [NSString stringWithFormat:@"%d", sum];
    
    // 4.退出键盘
    // 响应者
    // 第一响应者:叫出键盘的那个控件
    
    // 不当第一响应者(就会把键盘退下)
//    [self.num1 resignFirstResponder];
//    [self.num2 resignFirstResponder];
    
    [self.view endEditing:YES];
}

@end
