//
//  MainContentTableViewController.m
//  TelephoneNote
//
//  Created by ysj on 15/7/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "MainContentTableViewController.h"
#import "AddTelNumViewController.h"
#import "TelephoneNumCellTableViewCell.h"

#define path [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"record.data"]

@interface MainContentTableViewController () <UIActionSheetDelegate,AddTelNumViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *recordArr;
@end


@implementation MainContentTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationControllerBar];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    NSString *home = NSHomeDirectory();
//    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
//    _recordArr = [NSMutableArray arrayWithArray:[NSArray arrayWithContentsOfFile:filePath]];
}

- (void)initNavigationControllerBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClicked)];
    UIBarButtonItem *addBBI = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarItemClicked)];
    UIBarButtonItem *editBBI = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(deleteAllTelphones)];
    
    self.navigationItem.rightBarButtonItems = @[addBBI,editBBI];
    self.navigationItem.title = @"加TM的手机号啊";
}

- (void)leftBarItemClicked{
    UIActionSheet *exitAction = [[UIActionSheet alloc]initWithTitle:@"确定要注销吗" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [exitAction showInView:self.view];
}

- (void)rightBarItemClicked{
    AddTelNumViewController *addTelNumViewController = [[AddTelNumViewController alloc]init];
    addTelNumViewController.delegate = self;
    UINavigationController *addUNController = [[UINavigationController alloc]initWithRootViewController:addTelNumViewController];
    
    [self.navigationController presentViewController:addUNController animated:YES completion:^{
        NSLog(@"present over!");
    }];
//    [self.navigationController pushViewController:addTelNumViewController animated:YES];
}

- (void)deleteAllTelphones{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)addNewTelephoneNum:(Record *)record{
    [self.recordArr addObject:record];
    
//    NSString *home = NSHomeDirectory();
//    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
//    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    [NSKeyedArchiver archiveRootObject:self.recordArr toFile:path];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TelephoneNumCellTableViewCell *cell = [TelephoneNumCellTableViewCell cellWithTableView:tableView];
    cell.record = self.recordArr[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recordArr.count;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.recordArr removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [NSKeyedArchiver archiveRootObject:self.recordArr toFile:path];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
}

- (NSMutableArray *)recordArr{
    if (_recordArr == nil) {
        _recordArr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (_recordArr == nil) {
            _recordArr = [NSMutableArray array];
        }
    }
    return _recordArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
