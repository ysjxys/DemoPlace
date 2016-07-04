//
//  MJViewController.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJTg.h"
#import "MJTgCell.h"

@interface MJViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tgs;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置每一行cell的高度
    self.tableView.rowHeight = 80;
}

/**
 *  隐藏状态栏
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

/**
 *  数据的懒加载
 */
- (NSArray *)tgs
{
    if (_tgs == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJTg *tg = [MJTg tgWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [tgArray addObject:tg];
        }
        
        // 4.赋值
        _tgs = tgArray;
    }
    return _tgs;
}

#pragma mark - 数据源方法
/**
 *  一共有多少行数据
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

/**
 *  每一行显示怎样的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJTgCell *cell = [MJTgCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.tg = self.tgs[indexPath.row];
    return cell;
}
@end
