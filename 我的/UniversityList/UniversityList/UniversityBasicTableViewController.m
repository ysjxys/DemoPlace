//
//  UniversityBasicTableViewController.m
//  UniversityList
//
//  Created by ysj on 15/8/19.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "UniversityBasicTableViewController.h"
#import "CNUniversity.h"
#import "UniversityTableViewCell.h"
#import "CNUniversityGroup.h"

@interface UniversityBasicTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign, getter=isCNU) BOOL CNU;

@end

@implementation UniversityBasicTableViewController

- (instancetype)initWithCNU:(BOOL)CNU{
    UniversityBasicTableViewController *un = [super init];
    un.CNU = CNU;
    return un;
}

- (instancetype)init{
    UniversityBasicTableViewController *un = [super init];
    un.CNU = YES;
    return un;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.dataArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CNUniversityGroup *group = self.dataArr[section];
    return group.universities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNUniversityGroup *group = self.dataArr[indexPath.section];
    CNUniversity *university = group.universities[indexPath.row];
    
    return nil;
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"university.plist" ofType:@""];
        NSArray *dicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in dicts) {
            [tempArr addObject:[CNUniversityGroup groupWithDict:dict]];
        }
        _dataArr = tempArr;
    }
    return _dataArr;
}


@end
