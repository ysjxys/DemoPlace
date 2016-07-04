//
//  WebViewController.m
//  Thread
//
//  Created by ysj on 15/8/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIBarButtonItem *back;
@property (nonatomic, strong) UIBarButtonItem *forward;
@end

@implementation WebViewController

- (instancetype)init{
    if (self = [super init]) {
//        self.view.frame = ;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 524, 320, 44)];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"后退" style:UIBarButtonItemStyleBordered target:self action:@selector(goBack)];
    self.back = back;
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *forward = [[UIBarButtonItem alloc]initWithTitle:@"前进" style:UIBarButtonItemStyleDone target:self action:@selector(goForward)];
    self.forward = forward;
    toolbar.items = @[back,flexible,forward];
    [self.view addSubview:toolbar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.back.enabled = self.webView.canGoBack;
    self.forward.enabled = self.webView.canGoForward;
}

- (void)goForward{
    [self.webView goForward];
}

- (void)goBack{
    [self.webView goBack];
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
