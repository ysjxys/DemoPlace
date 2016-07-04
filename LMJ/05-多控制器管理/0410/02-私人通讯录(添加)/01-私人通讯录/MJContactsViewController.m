//
//  MJContactsViewController.m
//  01-私人通讯录
//
//  Created by apple on 14-4-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJContactsViewController.h"
#import "MJAddViewController.h"
#import "MJContact.h"

@interface MJContactsViewController () <UIActionSheetDelegate, MJAddViewControllerDelegate>
- (IBAction)logout:(id)sender;
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation MJContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    static NSString *ID = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    // 2.设置cell的数据
    MJContact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 设置下一个控制器(添加联系人的控制器)的代理
    MJAddViewController *addVc = segue.destinationViewController;
    addVc.delegate = self;
}

#pragma mark - MJAddViewController的代理方法
- (void)addViewController:(MJAddViewController *)addVc didAddContact:(MJContact *)contact
{
    // 1.添加模型数据
    [self.contacts addObject:contact];
    
    // 2.刷新表格
    [self.tableView reloadData];
}
@end
