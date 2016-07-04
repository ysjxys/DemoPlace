//
//  MJViewController.m
//  01-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJCarGroup.h"

@interface MJViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置数据源
    self.tableView.dataSource = self;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        // 初始化
        // 德系品牌
        MJCarGroup *cg1 = [[MJCarGroup alloc] init];
        cg1.title = @"德系品牌";
        cg1.desc = @"德系品牌很好";
        cg1.cars = @[@"奥迪", @"宝马", @"奔驰", @"奥迪", @"宝马", @"奔驰", @"奥迪", @"宝马", @"奔驰", @"奥迪", @"宝马", @"奔驰"];
        
        // 日韩品牌
        MJCarGroup *cg2 = [[MJCarGroup alloc] init];
        cg2.title = @"日韩品牌";
        cg2.desc = @"日韩品牌很好haohaohao";
        cg2.cars = @[@"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田", @"本田", @"丰田"];
        
        // 欧系品牌
        MJCarGroup *cg3 = [[MJCarGroup alloc] init];
        cg3.title = @"欧系品牌";
        cg3.desc = @"欧系品牌goodgood";
        cg3.cars = @[@"兰博基尼", @"法拉利"];
        
        _carGroups = @[cg1, cg2, cg3];
    }
    return _carGroups;
}

#pragma mark - 数据源方法
/**
 *  一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

/**
 *  第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取得第section组对应的模型
    MJCarGroup *cg = self.carGroups[section];
    
    return cg.cars.count;
}

/**
 *  每一行显示怎样的内容(cell)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 取出第indexPath.section组对应的模型
    MJCarGroup *cg = self.carGroups[indexPath.section];
    
    // 取车第indexPath.row这行对应的品牌名称
    NSString *car = cg.cars[indexPath.row];
    
    // 设置cell显示的文字
    cell.textLabel.text = car;
    
    return cell;
}

/**
 *  第section组显示怎样的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MJCarGroup *cg = self.carGroups[section];
    
    return cg.title;
}

/**
 *  第section组显示怎样的尾部标题
 */
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    MJCarGroup *cg = self.carGroups[section];
//    
//    return cg.desc;
//}

@end