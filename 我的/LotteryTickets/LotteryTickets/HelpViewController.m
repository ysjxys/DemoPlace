//
//  HelpViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/20.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpWebHtml.h"
#import "SettingGroup.h"
#import "SettingArrowItem.h"
#import "HtmlViewController.h"
#import "LotteryNavigationController.h"

@interface HelpViewController()
@property (nonatomic, strong) NSArray *htmls;
@end

@implementation HelpViewController



-(void)viewDidLoad{
    [super viewDidLoad];
    [self initGroup0];
}

- (void)initGroup0{
    SettingGroup *group = [[SettingGroup alloc]init];
    NSMutableArray *tempArr = [NSMutableArray array];
    for (HelpWebHtml *html in self.htmls) {
        SettingArrowItem *arrowItem = [SettingArrowItem itemWithTitle:html.title destVcClass:nil];
        [tempArr addObject:arrowItem];
    }
    group.items = tempArr;
    [self.data addObject:group];
}

- (NSArray *)htmls{
    if (!_htmls) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:@""];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            HelpWebHtml *html = [HelpWebHtml htmlWithDict:dict];
            [tempArr addObject:html];
        }
        _htmls = tempArr;
    }
    return _htmls;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HtmlViewController *htmlVC = [[HtmlViewController alloc]init];
    htmlVC.html = self.htmls[indexPath.row];
    LotteryNavigationController *controller = [[LotteryNavigationController alloc]initWithRootViewController:htmlVC];
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}


@end
