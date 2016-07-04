//
//  HtmlViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/21.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "HtmlViewController.h"
#import "HelpWebHtml.h"
#import "HelpWebHtml.h"

@interface HtmlViewController()<UIWebViewDelegate>

@end

@implementation HtmlViewController


- (void)loadView{
    self.view = [[UIWebView alloc]init];
}

- (void)viewDidLoad{
    self.title = self.html.title;
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.html.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

- (void)close{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';",self.html.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}
@end
