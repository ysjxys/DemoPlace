//
//  ViewController.m
//  AppManager
//
//  Created by ysj on 15/6/3.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "AppsData.h"
#import "AppsView.h"

@interface ViewController ()<AppsViewDelegate>

@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}


- (void)appsClick:(AppsView *)appsView{
    NSLog(@"sssss");
}

- (void)createView{
    int numOfLine = 3;
    CGFloat appW = 85;
    CGFloat appH = 90;
    CGFloat marginX = (self.view.frame.size.width - numOfLine * 85) / (numOfLine + 1);
    CGFloat marginY = 15;
    NSLog(@"%lu",(unsigned long)_apps.count);
    for (int i = 0; i < self.apps.count; i++) {
        int row = i / numOfLine;
        int empty = i % numOfLine;
        CGFloat appX = marginX + (marginX + appW) * empty;
        CGFloat appY = 30 + marginY + (marginY + appH) * row;
        AppsView *view = [[AppsView alloc]initWithAppsData:self.apps[i]];
        view.delegate = self;
        view.frame = CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:view];
    }
}

- (NSArray *)apps{
    if(_apps == nil){
        NSMutableArray *tempArr = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        NSArray *appArr = [NSArray arrayWithContentsOfFile:path];
        for(NSDictionary *dict in appArr){
            AppsData *appsData = [[AppsData alloc]initWithDict:dict];
            [tempArr addObject:appsData];
        }
        _apps = tempArr;
    }
    return _apps;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
