//
//  ViewController.m
//  01.UIWebView
//
//  Created by 刘凡 on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goForwardButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1. 确定要访问的资源——URL
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];

    // 2. 建立网络请求
    // 提示：所有的网络访问的本质都是一个网络请求：即请求从服务器获取某一个资源
    // 因此在网络访问中，指定了要访问的资源地址之后，需要建立一个网络访问请求
    // 该请求的含义是：向服务器[请求][资源URL]
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // 3. UIWebView加载网络请求
    [self.webView loadRequest:request];
}

#pragma mark - 搜索栏代理方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *str = searchBar.text;
    
    // 1. 判断是否以http开头，如果没有则用百度搜索
    if (![str hasPrefix:@"http://"]) {
        str = [NSString stringWithFormat:@"http://m.baidu.com/s?word=%@", str];
    }
    
    // 2. 在URL中，如果包含中文字符串，需要将字符串转换为带百分号的格式
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    [self.view endEditing:YES];
}

#pragma mark - UIWebView代理方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.goBackButton.enabled = self.webView.canGoBack;
    self.goForwardButton.enabled = self.webView.canGoForward;
}

@end
