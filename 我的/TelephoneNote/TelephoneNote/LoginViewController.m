//
//  LoginViewController.m
//  TelephoneNote
//
//  Created by ysj on 15/7/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "LoginViewController.h"
#import "MainContentTableViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"

#define screemWidth 320

@interface LoginViewController ()

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *passwdField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UISwitch *autoLoginSwitch;
@property (nonatomic, strong) UISwitch *remPwdSwitch;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationControllerBar];
    [self initView];
    [self initNotification];
    [self readDefaultData];
    [self contextChanged:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    if (self.autoLoginSwitch.isOn) {
//        [self login];
    }
}

- (void)readDefaultData{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [data objectForKey:@"name"];
    if (self.remPwdSwitch.isOn) {
        self.passwdField.text = [data objectForKey:@"password"];
    }
}

- (void)test:(NSNotification *)note{
    NSLog(@"sss");
}

- (void)initNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:@"notname" object:self.nameField];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(contextChanged:) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(nameEnd) name:UITextFieldTextDidEndEditingNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(contextChanged:) name:UITextFieldTextDidChangeNotification object:self.passwdField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(passwordEnd) name:UITextFieldTextDidEndEditingNotification object:self.passwdField];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)contextChanged:(NSNotification *)note{
//    UITextField *t = note.object;
    self.loginBtn.enabled = self.nameField.text.length && self.passwdField.text.length ? YES : NO ;
//    if (self.nameField.text.length && self.passwdField.text.length) {
//        self.loginBtn.enabled = YES;
//    }else{
//        self.loginBtn.enabled = NO;
//    }
}

- (void)nameEnd{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    [data setObject:self.nameField.text forKey:@"name"];
}

- (void)passwordEnd{
    if (self.remPwdSwitch.isOn) {
        NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
        [data setObject:self.passwdField.text forKey:@"password"];
    }
}


- (void)login{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notname" object:self.nameField userInfo:@{@"title":@"title",@"content":@"xxx"}];
    if([self.nameField.text isEqualToString:@"xx"] && [self.passwdField.text isEqualToString:@"123"]){
        [MBProgressHUD showMessage:@"少女祈祷中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            MainContentTableViewController *mainContent = [[MainContentTableViewController alloc]initWithStyle:UITableViewStylePlain];
            [self.navigationController pushViewController:mainContent animated:YES];
        });
    }else{
        [MBProgressHUD showError:@"错了的说"];
    }
}

- (void)autoLoginSwitchChanged{
    if (self.autoLoginSwitch.isOn) {
        [self.remPwdSwitch setOn:YES animated:YES];
    }
}

- (void)remPwdSwitchChanged{
    if (!self.remPwdSwitch.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (void)initNavigationControllerBar{
    self.navigationItem.title = @"欢迎登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:nil action:nil];
}

- (void)initView{
    CGFloat viewHeight = 40;
    UIView *nameLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, screemWidth, viewHeight)];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, viewHeight)];
    nameLabel.text = @"账号：";
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [nameLineView addSubview:nameLabel];
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, 190, viewHeight)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.placeholder = @"请输入用户名";
    nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [nameLineView addSubview:nameField];
    self.nameField = nameField;
    
    UIView *passwdLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 160, screemWidth, viewHeight)];
    UILabel *passwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, viewHeight)];
    passwdLabel.textAlignment = NSTextAlignmentCenter;
    passwdLabel.text = @"密码：";
    [passwdLineView addSubview:passwdLabel];
    UITextField *passwdField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, 190, viewHeight)];
    passwdField.placeholder = @"请输入密码";
    passwdField.borderStyle = UITextBorderStyleRoundedRect;
    passwdField.secureTextEntry = YES;
    passwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [passwdLineView addSubview:passwdField];
    self.passwdField = passwdField;
    
    UIView *switchView = [[UIView alloc]initWithFrame:CGRectMake(0, 220, screemWidth, viewHeight)];
    UILabel *remPwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, viewHeight)];
    remPwdLabel.text = @"记住密码";
    [switchView addSubview:remPwdLabel];
    UISwitch *remPwdSwitch = [[UISwitch alloc]init];
    remPwdSwitch.frame = CGRectMake(90, (viewHeight-remPwdSwitch.frame.size.height)*0.5, 0, 0);
    [remPwdSwitch addTarget:self action:@selector(remPwdSwitchChanged) forControlEvents:UIControlEventValueChanged];
    remPwdSwitch.on = YES;
    self.remPwdSwitch = remPwdSwitch;
    [switchView addSubview:remPwdSwitch];
    UILabel *autoLoginLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, 80, viewHeight)];
    autoLoginLabel.text = @"自动登录";
    [switchView addSubview:autoLoginLabel];
    UISwitch *autoLoginSwitch = [[UISwitch alloc]init];
    autoLoginSwitch.frame = CGRectMake(230, (viewHeight-remPwdSwitch.frame.size.height)*0.5, 0, 0);
    [autoLoginSwitch addTarget:self action:@selector(autoLoginSwitchChanged) forControlEvents:UIControlEventValueChanged];
    autoLoginSwitch.on = YES;
    self.autoLoginSwitch = autoLoginSwitch;
    [switchView addSubview:autoLoginSwitch];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(120, 300, 80, 35);
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn setTitle:@"能点啦" forState:UIControlStateNormal];
    [loginBtn setTitle:@"不能点啊" forState:UIControlStateDisabled];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn = loginBtn;
    
    [self.view addSubview:nameLineView];
    [self.view addSubview:passwdLineView];
    [self.view addSubview:switchView];
    [self.view addSubview:loginBtn];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
