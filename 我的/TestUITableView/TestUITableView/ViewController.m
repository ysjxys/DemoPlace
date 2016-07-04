//
//  ViewController.m
//  TestUITableView
//
//  Created by ysj on 15/6/18.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "HeroData.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *heroData;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIAlertView *alert;
@property (nonatomic, strong) UIActivityIndicatorView *aiView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initTableView];
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    footView.backgroundColor = [UIColor redColor];
    [footView addSubview:self.aiView];
    self.tableView.tableFooterView = footView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroData *heroData = self.heroData[indexPath.row];
    self.alert = [[UIAlertView alloc]initWithTitle:heroData.name message:heroData.intro delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
    [self.alert show];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"hero";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    HeroData *heroData = self.heroData[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:heroData.icon];
    cell.textLabel.text = heroData.name;
    cell.detailTextLabel.text = heroData.intro;
    return cell;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (void) initUI{
    self.aiView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(150, 10, 10, 10)];
    self.aiView.hidesWhenStopped = YES;
    [self.aiView startAnimating];
}

- (void) initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSArray *)heroData{
    if(_heroData == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:@""];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *hData = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            HeroData *hero = [HeroData heroWithDict:dict];
            [hData addObject:hero];
        }
        _heroData = hData;
    }
    return _heroData;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
