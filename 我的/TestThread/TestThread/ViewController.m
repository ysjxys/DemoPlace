//
//  ViewController.m
//  TestThread
//
//  Created by ysj on 15/9/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<ASIHTTPRequestDelegate>
@property (nonatomic ,strong) ASIHTTPRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    [self.view addSubview:view];
//    view.backgroundColor = [UIColor grayColor];
    
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, 280, 50)];
    [view addSubview:nameField];
    nameField.placeholder = @"账号";
    nameField.borderStyle = UITextBorderStyleRoundedRect;
//    nameField.backgroundColor = [UIColor redColor];
    
    UITextField *pwdField = [[UITextField alloc]initWithFrame:CGRectMake(20, 70, 280, 50)];
    [view addSubview:pwdField];
    pwdField.borderStyle = UITextBorderStyleBezel;
    pwdField.placeholder = @"密码";
    
    UIButton *getLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [view addSubview:getLoginBtn];
    getLoginBtn.layer.borderWidth = 1;
    getLoginBtn.layer.borderColor = [UIColor blueColor].CGColor;
    getLoginBtn.frame = CGRectMake(50, 140, 80, 40);
    [getLoginBtn setTitle:@"get登陆" forState:UIControlStateNormal];
    [getLoginBtn addTarget:self action:@selector(getLoginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *postLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [view addSubview:postLoginBtn];
    postLoginBtn.layer.borderWidth = 1;
    postLoginBtn.layer.borderColor = [UIColor blueColor].CGColor;
    postLoginBtn.frame = CGRectMake(190, 140, 80, 40);
    [postLoginBtn setTitle:@"post登陆" forState:UIControlStateNormal];
    [postLoginBtn addTarget:self action:@selector(postLoginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)getLoginBtnClicked{
    NSLog(@"xx");
    self.request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://www.weather.com.cn/data/sk/101110101.html"]];
    self.request.delegate = self;
//    [self.request startAsynchronous];
    [self.request startSynchronous];
    NSLog(@"%@",[NSThread currentThread]);
}


- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"请求开始了");
    NSLog(@"%@",[NSThread currentThread]);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"请求结束了");
    //responseString就是response响应的正文内容.(即网页的源代码)
    NSString *str = request.responseString;
    NSLog(@"str is ---> %@",str);
    
//    SBJSON *json = [[SBJSON alloc] init];
//    NSDictionary *dic = [json objectWithString:str];
//    NSLog(@"dic = %@",dic);
//    
//    NSDictionary *weatherinfo = [dic objectForKey:@"weatherinfo"];
//    NSLog(@"weatherinfo  =  %@",weatherinfo);
//    
//    NSString *city = [weatherinfo objectForKey:@"city"];
//    cityLabel.text = city;
//    
//    NSString *date = [weatherinfo objectForKey:@"date_y"];
//    dateLabel.text = date;
//    
//    NSString *week = [weatherinfo objectForKey:@"week"];
//    weekLabel.text = week;
//    
//    NSString *cityid = [weatherinfo objectForKey:@"cityid"];
//    cityidLabel.text = cityid;
//    
//    NSString *temp = [weatherinfo objectForKey:@"temp1"];
//    tempLabel.text = temp;
//    
//    NSString *weather = [weatherinfo objectForKey:@"weather1"];
//    weatherLabel.text = weather;
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"请求失败了");
    NSLog(@"%@",[NSThread currentThread]);
}

- (void)postLoginBtnClicked{
    NSLog(@"ss");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
