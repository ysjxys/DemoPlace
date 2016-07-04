//
//  MJViewController.m
//  04-英雄展示
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJHero.h"

@interface MJViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置行高(每一行的高度一致)
//    self.tableView.rowHeight = 60;
    
//    self.tableView.delegate = self;
}

- (NSArray *)heros
{
    if (_heros == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *heroArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJHero *hero = [MJHero heroWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [heroArray addObject:hero];
        }
        
        // 4.赋值
        _heros = heroArray;
    }
    return _heros;
}

#pragma mark - 数据源方法
// 不实现这个方法,默认就是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    // 取出模型
    MJHero *hero = self.heros[indexPath.row];
    
    // 设置cell的数据
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
}

#pragma mark - 代理方法
/**
 *  每一行的高度不一致的时候使用这个方法来设置行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) return 100;
    return 60;
}

@end
