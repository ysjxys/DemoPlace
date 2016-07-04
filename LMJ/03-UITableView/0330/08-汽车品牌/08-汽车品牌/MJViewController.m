//
//  MJViewController.m
//  08-汽车品牌
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJCarGroup.h"
#import "MJCar.h"

@interface MJViewController ()<UITableViewDataSource>
/**
 *  车品牌组数据
 */
@property (nonatomic, strong) NSArray *groups;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)groups
{
    if (_groups == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJCarGroup *group = [MJCarGroup groupWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [groupArray addObject:group];
        }
        
        // 4.赋值
        _groups = groupArray;
    }
    return _groups;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MJCarGroup *group = self.groups[section];
    
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义一个循环标识
    static NSString *ID = @"car";
    
    // 2.从缓存池中取出可循环利用cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.缓存池中没有可循环利用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 4.设置数据
    MJCarGroup *group = self.groups[indexPath.section];
    MJCar *car = group.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

/**
 *  第section组显示的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MJCarGroup *group = self.groups[section];
    return group.title;
}

/**
 *  返回右边索引条显示的字符串数据
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.groups valueForKeyPath:@"title"];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
