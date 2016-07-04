//
//  ViewController.m
//  03.用户登录
//
//  Created by 刘凡 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Password.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;

@property (nonatomic, strong) NSMutableData *data;

@property (nonatomic, strong) NSString *loginPwd;

@end

@implementation ViewController

- (NSString *)loginPwd
{
    return [self.userPwd.text MD5];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)logon
{
    NSURL *url = [NSURL URLWithString:@"http://localhost/login.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    
    request.HTTPMethod = @"POST";
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@", self.userName.text, self.loginPwd];
    NSLog(@"%@", body);
    
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
}

#pragma mark - 代理方法
#pragma mark 接收到服务器的响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 准备工作
    if (!self.data) {
        self.data = [NSMutableData data];
    } else {
        self.data = nil;
    }
}

#pragma mark 收到数据（有可能是一部分）
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 数据后续处理
    NSString *result = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", result);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error.localizedDescription);
}

@end
