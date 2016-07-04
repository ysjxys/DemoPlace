//
//  AddTelNumViewController.m
//  TelephoneNote
//
//  Created by ysj on 15/7/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "AddTelNumViewController.h"
#import "Record.h"

#define ScreenWidth 320
#define LabelHeight 44

@interface AddTelNumViewController ()

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *numField;
@property (nonatomic, strong) UIButton *sureBtn;

@end

@implementation AddTelNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationControllerBar];
    [self initView];
    [self initNotification];
    [self textChanged];
}

- (void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [self.nameField becomeFirstResponder];
}

- (void)initNavigationControllerBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

- (void)initNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.numField];
}

- (void)addNum{
    [self cancel];
    Record *record = [[Record alloc]init];
    record.name = self.nameField.text;
    record.telephoneNum = self.numField.text;
    [self.delegate addNewTelephoneNum:record];
}

- (void)textChanged{
    self.sureBtn.enabled = (self.nameField.text.length > 0 && self.numField.text.length > 0 );
}

- (void)cancel{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss over");
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initView{
    UIView *nameView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, LabelHeight)];
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, LabelHeight)];
    [nameView addSubview:nameLabel];
    nameLabel.text = @"姓名";
    nameLabel.textAlignment = NSTextAlignmentRight;
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(90, 0, ScreenWidth-130, LabelHeight)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameField = nameField;
    [nameView addSubview:nameField];
    
    UIView *numView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, LabelHeight)];
    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, LabelHeight)];
    [numView addSubview:numLabel];
    numLabel.text = @"手机号";
    numLabel.textAlignment = NSTextAlignmentRight;
    UITextField *numField = [[UITextField alloc]initWithFrame:CGRectMake(90, 0, ScreenWidth-130, LabelHeight)];
    numField.borderStyle = UITextBorderStyleRoundedRect;
    numField.keyboardType = UIKeyboardTypeNumberPad;
    self.numField = numField;
    [numView addSubview:numField];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    sureBtn.frame = CGRectMake(100, 240, 120, 80);
    [sureBtn setTitle:@"添加" forState:UIControlStateNormal];
    [sureBtn setTitle:@"添加不能" forState:UIControlStateDisabled];
    [sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(addNum) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn = sureBtn;
    
    [self.view addSubview:nameView];
    [self.view addSubview:numView];
    [self.view addSubview:sureBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
