//
//  MJContactsViewController.m
//  01-私人通讯录
//
//  Created by apple on 14-4-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJContactsViewController.h"
#import "MJAddViewController.h"
#import "MJEditViewController.h"
#import "MJContact.h"
#import "MJContactCell.h"

@interface MJContactsViewController () <UIActionSheetDelegate, MJAddViewControllerDelegate, MJEditViewControllerDelegate>
- (IBAction)logout:(id)sender;
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation MJContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.rowHeight = 70;
}

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJContactCell *cell = [MJContactCell cellWithTableView:tableView];
    
    // 2.设置cell的数据
    cell.contact = self.contacts[indexPath.row];
    
    return cell;
}

//- (void)setName:(NSString *)name phone:(NSString *)phone
//{
//    NSLog(@"MJContactsViewController-%@-%@", name, phone);
//}

/**
 *  注销
 */
- (IBAction)logout:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

#pragma mark - actionsheet的代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0) return;
    
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  执行跳转之前会调用
 *  在这个方法中,目标控制器的view还没有被创建
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id vc = segue.destinationViewController;
    
    if ([vc isKindOfClass:[MJAddViewController class]]) { // 如果是跳转到添加联系人的控制器
        // 设置下一个控制器(添加联系人的控制器)的代理
        MJAddViewController *addVc = vc;
        addVc.delegate = self;
    } else if ([vc isKindOfClass:[MJEditViewController class]]) { // 如果是跳转到查看(编辑)联系人的控制器
        MJEditViewController *editVc = vc;
        // 取得选中的那行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.contact = self.contacts[path.row];
        editVc.delegate = self;
    }
}

#pragma mark - MJAddViewController的代理方法
- (void)addViewController:(MJAddViewController *)addVc didAddContact:(MJContact *)contact
{
    // 1.添加模型数据
    [self.contacts addObject:contact];
    
    // 2.刷新表格
    [self.tableView reloadData];
}

#pragma mark - MJEditViewController的代理方法
- (void)editViewController:(MJEditViewController *)editVc didSaveContact:(MJContact *)contact
{
    [self.tableView reloadData];
}
@end
