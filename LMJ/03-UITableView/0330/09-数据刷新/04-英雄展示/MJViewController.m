//
//  MJViewController.m
//  04-英雄展示
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJHero.h"

@interface MJViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
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
    NSLog(@"numberOfRowsInSection-----");
    return self.heros.count;
}

// 离开屏幕的cell会怎样

/**
 *  每当有一个cell进入视野范围内,就会调用
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath-----%d", indexPath.row);
    
    // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString *ID = @"hero";
    
    // 1.通过一个标识去缓存池中寻找可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
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

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取得被点击这行对应的模型
    MJHero *hero = self.heros[indexPath.row];
    
    // 弹框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"数据展示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    // 设置对话框的类型
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    // 取得唯一的那个文本框,显示英雄的名称
    [alert textFieldAtIndex:0].text = hero.name;
    
    [alert show];
    
    // 绑定行号到alertView上
    alert.tag = indexPath.row;
}

#pragma mark - alertView的代理方法
/**
 *  点击了alertView上面的按钮就会调用这个方法
 *
 *  @param buttonIndex 按钮的索引,从0开始
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) return;
    
    // 按钮的索引肯定不是0
    
    // 1.取得文本框最后的文字
    NSString *name = [alertView textFieldAtIndex:0].text;
//    int row = alertView.tag;
//    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
//    cell.textLabel.text = name;
    
    // 2.修改模型数据
    int row = alertView.tag;
    MJHero *hero = self.heros[row];
    hero.name = name;
    
    // 3.告诉tableView重新加载模型数据
    // reloadData : tableView会向数据源重新请求数据
    // 重新调用数据源的相应方法取得数据
    // 重新调用数据源的tableView:numberOfRowsInSection:获得行数
    // 重新调用数据源的tableView:cellForRowAtIndexPath:得知每一行显示怎样的cell
    // 全部刷新
//    [self.tableView reloadData];
    
    // 局部刷新
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationBottom];
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Deselect : 取消选中
//    NSLog(@"取消选中了第%d行", indexPath.row);
//}

@end
