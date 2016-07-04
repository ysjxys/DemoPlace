//
//  MJViewController.m
//  01-汽车品牌
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
    
    // 设置数据源
    self.tableView.dataSource = self;
}

#pragma mark - 数据源方法
/**
 *  一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

/**
 *  第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) { // 德系品牌
        return 3;
    } else if (section == 1) { // 日韩品牌
        return 4;
    } else { // 欧系品牌
        return 2;
    }
}

/**
 *  每一行显示怎样的内容(cell)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.section == 0) { // 德系品牌(第0组)
        
        if (indexPath.row == 0) { // 第0组的第0行
            cell.textLabel.text = @"奥迪";
        } else if (indexPath.row == 1) { // 第0组的第1行
            cell.textLabel.text = @"宝马";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"奔驰";
        }
        
    } else if (indexPath.section == 1) { // 日韩品牌(第1组)
        
        if (indexPath.row == 0) { // 第1组的第0行
            cell.textLabel.text = @"本田";
        } else if (indexPath.row == 1) { // 第1组的第1行
            cell.textLabel.text = @"丰田";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"铃木";
        } else if (indexPath.row == 3) {
            cell.textLabel.text = @"三菱";
        }
        
    } else if (indexPath.section == 2) { // 欧系品牌(第2组)
        
        if (indexPath.row == 0) { // 第2组的第0行
            cell.textLabel.text = @"兰博基尼";
        } else if (indexPath.row == 1) { // 第2组的第1行
            cell.textLabel.text = @"劳斯莱斯";
        }
        
    }
    
    return cell;
}

/**
 *  第section组显示怎样的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"德系品牌";
    } else if (section == 1) {
        return @"日韩品牌";
    } else {
        return @"欧系品牌";
    }
}

/**
 *  第section组显示怎样的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"世界一流品牌";
    } else if(section == 1) {
        return @"牛逼哄哄";
    } else {
        return @"价格昂贵";
    }
}

@end