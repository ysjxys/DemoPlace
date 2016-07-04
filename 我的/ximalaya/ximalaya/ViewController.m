//
//  ViewController.m
//  ximalaya
//
//  Created by ysj on 15/6/9.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "ButtonData.h"
#import "SingleUIButton.h"

@interface ViewController () <UIScrollViewDelegate,SingleUIButtonDelegate>

@property (nonatomic, strong) NSArray *picturesArr;
@property (nonatomic, strong) NSArray *buttonsArr;
@property (nonatomic, strong) UIScrollView *frontScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self addTimer];
}

- (void)singleBtnClick:(SingleUIButton *)btn{
    NSString *title = btn.btnData.describe;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextPage{
    NSInteger nowPage = self.pageControl.currentPage;
    self.pageControl.currentPage = nowPage >= self.picturesArr.count - 1 ? 0 : ++nowPage;
    [self.frontScrollView setContentOffset:CGPointMake(self.pageControl.currentPage * self.frontScrollView.frame.size.width, 0) animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width = scrollView.frame.size.width;
    self.pageControl.currentPage = (scrollView.contentOffset.x + width * 0.5)/width;
}

- (void)createView{
    UIScrollView *backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20)];
    [self.view addSubview:backScrollView];
    [backScrollView setBackgroundColor:[UIColor colorWithRed:202.0/256 green:202.0/256 blue:202.0/256 alpha:1]];
    backScrollView.contentSize = CGSizeMake(0, 740);
    backScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 50);
    backScrollView.showsVerticalScrollIndicator = NO;
    
    CGFloat width = self.view.frame.size.width;
    UIImage *picImg = [UIImage imageNamed:self.picturesArr[0]];
    CGFloat height = width / picImg.size.width * picImg.size.height;
    self.frontScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [backScrollView addSubview:self.frontScrollView];
    self.frontScrollView.contentSize = CGSizeMake(self.view.frame.size.width * self.picturesArr.count, 0);
    for (int i = 0; i < self.picturesArr.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
        imgView.image = [UIImage imageNamed:self.picturesArr[i]];
        [self.frontScrollView addSubview:imgView];
    }
    self.frontScrollView.pagingEnabled = YES;
    self.frontScrollView.showsHorizontalScrollIndicator = NO;
    self.frontScrollView.delegate = self;
    
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100, height - 20, 60, 10)];
    [backScrollView addSubview:self.pageControl];
    self.pageControl.numberOfPages = self.picturesArr.count;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    CGFloat btnWH = 145;
    CGFloat distXY = 10;
    int numPerLine = 2;
    NSUInteger numOfBtn = self.buttonsArr.count;
    unsigned long numOfRow = numOfBtn % numPerLine + numOfBtn / numPerLine;
    CGFloat viewH = (btnWH + distXY) * numOfRow;
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, height, width, viewH)];
    [btnView setBackgroundColor:[UIColor clearColor]];
    [backScrollView addSubview:btnView];
    for(int i = 0; i < numOfBtn; i++){
        SingleUIButton *newBtn = [SingleUIButton singleBtnWithBtnData:self.buttonsArr[i]];
        CGFloat btnDistX = i % numPerLine * (btnWH + distXY) + distXY;
        CGFloat btnDistY = i / numPerLine * (btnWH + distXY) +distXY;
        newBtn.frame = CGRectMake(btnDistX, btnDistY, btnWH, btnWH);
        newBtn.delegate = self;
        [btnView addSubview:newBtn];
    }
    
    CGFloat myBtnH = 75;
    UIButton *myBtn = [[UIButton alloc]initWithFrame:CGRectMake(distXY, btnView.frame.origin.y + btnView.frame.size.height + distXY, width - 2 * distXY, myBtnH)];
    [backScrollView addSubview:myBtn];
    [myBtn setImage:[UIImage imageNamed:@"finditem_iwannabehere"] forState:UIControlStateNormal];
    
    CGFloat buttonLabelH = 40;
    UILabel *buttonLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - buttonLabelH, width, buttonLabelH)];
    buttonLabel.alpha = 0.5;
    [buttonLabel setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:buttonLabel];
}

- (NSArray *)buttonsArr{
    
    if(_buttonsArr == nil){
        NSMutableArray *tempArr = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"buttonPictures" ofType:@"plist"];
        NSArray *data = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in data) {
            ButtonData *btnData = [[ButtonData alloc]initWithDict:dict];
            [tempArr addObject:btnData];
        }
        _buttonsArr = tempArr;
    }
    return _buttonsArr;
}

- (NSArray *)picturesArr{
    if(_picturesArr == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"circlePictures" ofType:@"plist"];
        _picturesArr = [NSArray arrayWithContentsOfFile:path];
    }
    return _picturesArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
