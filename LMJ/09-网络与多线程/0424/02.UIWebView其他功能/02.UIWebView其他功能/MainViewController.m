//
//  MainViewController.m
//  02.UIWebView其他功能
//
//  Created by 刘凡 on 14-4-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSBundle *docsBundle;
@property (nonatomic, strong) NSArray *files;

@end

@implementation MainViewController
/**
 1. 从docs.bundle中加载所有文件列表
 */

- (NSBundle *)docsBundle
{
    if (!_docsBundle) {
        NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"docs.bundle"];
        _docsBundle = [NSBundle bundleWithPath:path];
    }
    
    return _docsBundle;
}

- (NSArray *)files
{
    if (!_files) {
        _files = [[NSFileManager defaultManager] subpathsAtPath:self.docsBundle.bundlePath];
    }
    
    return _files;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.files.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = self.files[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Load File" sender:indexPath];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)indexPath
{
    ViewController *vc = segue.destinationViewController;
    
    NSString *fileName = self.files[indexPath.row];
    
    vc.fileURL = [self.docsBundle URLForResource:fileName withExtension:nil];
    vc.title = fileName;
}

@end
