//
//  MJViewController.m
//  06-tableView的常见属性
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 32bit颜色 : ARGB
    // Alpha : 8
    // Red : 8
    // Green : 8
    // Blue : 8
    
    // 24bit颜色 : RGB
    // Red : 8
    // Green : 8
    // Blue : 8
    
    // #ff ff ff  白色
    // #00 00 00  黑色
    // #ff 00 00  红色
    // # ff ff 00
    // #ff ff ff ff
    
    // 每一个颜色通道占据8个二进制位
    // 每一个颜色通道的取值范围是[0, 255]
    
    // R 78
    // G 100
    // B 255
    
    // # ff ff 00 ff
    
    self.tableView.separatorColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:0 alpha:255/255.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // 表格的头部控件(直接显示表格的最顶部)
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.tableView.tableFooterView = [[UISwitch alloc] init];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行数据", indexPath.row];
    
    return cell;
}

@end
