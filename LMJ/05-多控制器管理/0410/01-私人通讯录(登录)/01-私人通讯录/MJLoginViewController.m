//
//  MJLoginViewController.m
//  01-私人通讯录
//
//  Created by apple on 14-4-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJLoginViewController.h"
#import "MBProgressHUD+MJ.h"

@interface MJLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
- (IBAction)rmbPwdChange;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
- (IBAction)autoLoginChange;
- (IBAction)login;
@end

@implementation MJLoginViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdField];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  文本框的文字发生改变的时候调用
 */
- (void)textChange
{
    // 控制按钮的状态
//    if (self.accountField.text.length && self.pwdField.text.length) {
//        self.loginBtn.enabled = YES;
//    } else {
//        self.loginBtn.enabled = NO;
//    }
    self.loginBtn.enabled = (self.accountField.text.length && self.pwdField.text.length);
}

/**
 *  记住密码开关的状态改变就会调用
 */
- (IBAction)rmbPwdChange {
    // 取消了记住密码
    if (self.rmbPwdSwitch.isOn == NO) {
        self.autoLoginSwitch.on = NO;
    }
}

/**
 *  自动登录的状态改变就会调用
 */
- (IBAction)autoLoginChange {
    if (self.autoLoginSwitch.isOn) {
        self.rmbPwdSwitch.on = YES;
    }
}

/**
 *  登录
 */
- (IBAction)login { // 帐号:mj  密码:123
    if (![self.accountField.text isEqualToString:@"mj"]) {
        // 帐号不存在
        [MBProgressHUD showError:@"帐号不存在"];
        return;
    }
    
    if (![self.pwdField.text isEqualToString:@"123"]) {
        // 密码错误
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    
    // 显示一个蒙版(遮盖)
    [MBProgressHUD showMessage:@"哥正在帮你登录中...."];
    
    // 发送网络请求
    
    // 模拟(2秒后执行跳转)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 移除遮盖
        [MBProgressHUD hideHUD];
        
        // 跳转 -- 执行login2contacts这个segue
        [self performSegueWithIdentifier:@"login2contacts" sender:nil];
    });
}
@end
