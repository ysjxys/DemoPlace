//
//  MainViewController.m
//  Thread
//
//  Created by ysj on 15/8/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MainViewController.h"
#import "MainBasicCellItem.h"
#import "MainCellGroups.h"
#import "WebViewController.h"
#import "SourceViewController.h"

@interface MainViewController()
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initGroup0];
}

- (void)initGroup0{
    MainBasicCellItem *item0 = [MainBasicCellItem itemWithTitle:@"web"];
    item0.option = ^{
        WebViewController *web = [[WebViewController alloc]init];
        [self.navigationController pushViewController:web animated:YES];
    };
    MainBasicCellItem *item1 = [MainBasicCellItem itemWithTitle:@"source"];
    item1.option = ^{
        SourceViewController *source = [[SourceViewController alloc]init];
        [self.navigationController pushViewController:source animated:YES];
    };
    NSArray *items = @[item0, item1];
    
    MainCellGroups *group0 = [MainCellGroups groupWithItems:items];
    
    [self.dataArr addObject:group0];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MainCellGroups *group = self.dataArr[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"maincell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    MainCellGroups *group = self.dataArr[indexPath.section];
    MainBasicCellItem *itemData = group.items[indexPath.row];
    cell.textLabel.text = itemData.title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainCellGroups *group = self.dataArr[indexPath.section];
    MainBasicCellItem *itemData = group.items[indexPath.row];
    if (itemData.option) {
        itemData.option();
    }
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
