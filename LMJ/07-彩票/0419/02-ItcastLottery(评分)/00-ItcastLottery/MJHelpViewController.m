//
//  MJHelpViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJHelpViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingGroup.h"
#import "MJHtmlViewController.h"
#import "MJNavigationController.h"
#import "MJHtml.h"

@interface MJHelpViewController ()
@property (nonatomic, strong) NSArray *htmls;
@end

@implementation MJHelpViewController

- (NSArray *)htmls
{
    if (_htmls == nil) {
        
        // JSON文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 加载JSON文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // 将JSON数据转为NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 将字典转成模型
        NSMutableArray *htmlArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJHtml *html = [MJHtml htmlWithDict:dict];
            [htmlArray addObject:html];
        }
        
        _htmls = htmlArray;
    }
    return _htmls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建所有的item
    NSMutableArray *items = [NSMutableArray array];
    for (MJHtml *html in self.htmls) {
        MJSettingItem *item = [MJSettingArrowItem itemWithTitle:html.title destVcClass:nil];
        [items addObject:item];
    }
    
    // 2.创建组
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = items;
    [self.data addObject:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJHtmlViewController *htmlVc = [[MJHtmlViewController alloc] init];
    htmlVc.html = self.htmls[indexPath.row];
    MJNavigationController *nav = [[MJNavigationController alloc] initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
