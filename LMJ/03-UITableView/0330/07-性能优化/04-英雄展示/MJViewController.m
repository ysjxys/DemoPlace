//
//  MJViewController.m
//  04-英雄展示
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJHero.h"

@interface MJViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置行高(每一行的高度一致)
    self.tableView.rowHeight = 60;
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

// 离开屏幕的cell会怎样

/**
 *  每当有一个cell进入视野范围内,就会调用
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString *ID = @"hero";
    
    // 1.通过一个标识去缓存池中寻找可循环利用的cell
    // dequeue : 出列 (查找)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        NSLog(@"------缓存池找不到cell--%d", indexPath.row);
    }
    
    // 3.给cell设置新的数据
    // 取出模型
    MJHero *hero = self.heros[indexPath.row];
    
    // 设置cell的数据
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
}
@end
