//
//  MJViewController.m
//  04-微博
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJStatus.h"
#import "MJStatusFrame.h"
#import "MJStatusCell.h"

@interface MJViewController ()
//@property (nonatomic, strong) NSArray *statuses;
/**
 *  存放所有cell的frame模型数据
 */
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tableView.rowHeight = 400;
}

- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建MJStatus模型对象
            MJStatus *status = [MJStatus statusWithDict:dict];
            
            // 3.2.创建MJStatusFrame模型对象
            MJStatusFrame *statusFrame = [[MJStatusFrame alloc] init];
            statusFrame.status = status;
            
            // 3.2.添加模型对象到数组中
            [statusFrameArray addObject:statusFrame];
        }
        
        // 4.赋值
        _statusFrames = statusFrameArray;
    }
    return _statusFrames;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJStatusCell *cell = [MJStatusCell cellWithTableView:tableView];
    
    // 2.在这个方法算好了cell的高度
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    // 3.返回cell
    return cell;
}

#pragma mark - 实现代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出这行对应的frame模型
    MJStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

@end
