//
//  MJViewController.m
//  04-微博
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJStatus.h"
#import "MJStatusCell.h"

@interface MJViewController ()
@property (nonatomic, strong) NSArray *statuses;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 400;
}

- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJStatus *status = [MJStatus statusWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [statusArray addObject:status];
        }
        
        // 4.赋值
        _statuses = statusArray;
    }
    return _statuses;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"status";
    MJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MJStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.status = self.statuses[indexPath.row];
    
    return cell;
}

@end
