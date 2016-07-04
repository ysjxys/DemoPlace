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
//    NSLog(@"numberOfSectionsInTableView-一共有多少组数据");
    return 2;
}

/**
 *  第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"numberOfRowsInSection-%d", section);
    
    if (section == 0) {
        return 3;
    } else {
        return 4;
    }
}

/**
 *  每一行显示怎样的内容(cell)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"cellForRowAtIndexPath-%d组%d行", indexPath.section, indexPath.row);
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
    }
    
    return cell;
}

@end
