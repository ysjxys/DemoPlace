//
//  SourceViewController.m
//  Thread
//
//  Created by ysj on 15/8/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "SourceViewController.h"

@interface SourceViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"关于.txt" withExtension:nil];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self.webView loadData:data MIMEType:[self mimeTypeWithUrl:url] textEncodingName:@"UTF8" baseURL:nil];
}

- (NSString *)mimeTypeWithUrl:(NSURL *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    return response.MIMEType;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
