//
//  ViewController.m
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "CellFrame.h"
#import "MicroblogTableViewCell.h"
#import "StatusData.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *arrays;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (NSArray *)arrays{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:@""];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for(NSDictionary *dict in arr){
        StatusData *statusData = [StatusData statusWithDict:dict];
        CellFrame *cellFrame = [[CellFrame alloc]init];
        cellFrame.statusData = statusData;
        [tempArr addObject:cellFrame];
    }
    _arrays = tempArr;
    return _arrays;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MicroblogTableViewCell *cell = [MicroblogTableViewCell cellWithTableView:tableView];
    
    cell.cellFrame = self.arrays[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellFrame *cellFrame = self.arrays[indexPath.row];
    return cellFrame.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrays.count;
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
