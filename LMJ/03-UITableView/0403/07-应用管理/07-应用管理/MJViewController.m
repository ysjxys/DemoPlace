//
//  MJViewController.m
//  07-应用管理
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJApp.h"
#import "MJAppCell.h"

@interface MJViewController () <MJAppCellDelegate>
@property (nonatomic, strong) NSArray *apps;
@end

@implementation MJViewController
- (NSArray *)apps
{
    if (_apps == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJApp *app = [MJApp appWithDict:dict];
            [appArray addObject:app];
        }
        _apps = appArray;
    }
    return _apps;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app"];
    cell.delegate = self;
    cell.app = self.apps[indexPath.row];
    return cell;
}

#pragma mark - cell的代理方法
- (void)appCellDidClickedDownloadBtn:(MJAppCell *)cell
{
    // 1.添加标签
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"成功下载%@", cell.app.name];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 0, 150, 25);
    label.center = CGPointMake(160, 240);
    label.alpha = 0.0;
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    [self.view addSubview:label];
    
    // 2.动画
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

@end
