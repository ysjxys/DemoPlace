//
//  ViewController.m
//  GuessPicture
//
//  Created by ysj on 15/6/6.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"
#import "ChooseBtnView.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *imgBtn;
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIButton *coverBtn;
@property (nonatomic, strong) UIView *answerView;
@property (nonatomic, strong) UIView *optionView;
@property (nonatomic, strong) UIButton *scoreBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    _index = -1;
    [self clickNextBtn];
}

- (void) clickNextBtn{
    _index == self.questions.count - 1 ? _index = 0 : _index++;
    
    Question *question = self.questions[self.index];
    //更新数据
    [self settingData:question];
    //答题框构成
    [self settingAnswerBtn:question];
    //备选框构成
    [self settingOptionBtn:question];
}

- (void) settingOptionBtn:(Question *)question{
    for (UIView *view in [self.optionView subviews]) {
        [view removeFromSuperview];
    }
    CGFloat btnX = 35;
    CGFloat btnD = 8;
    int num = 7;
    CGFloat xdist = (self.view.frame.size.width - num *(btnX + btnD) + btnD) * 0.5;
    NSArray *optionArr = question.options;
    for(int i = 0; i < optionArr.count; i++){
        int row = i/num;
        ChooseBtnView *optionBtn = [ChooseBtnView chooseOptionBtnWithString:optionArr[i]];
        optionBtn.frame = CGRectMake(xdist + i%num * (btnD + btnX), row * (btnX + btnD), btnX, btnX);
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.optionView addSubview:optionBtn];
    }
}

- (void) optionClick:(UIButton *)optionBtn{
    for (UIButton *answerBtn in [self.answerView subviews]) {
        if(answerBtn.currentTitle == nil){
            [answerBtn setTitle:optionBtn.currentTitle forState:UIControlStateNormal];
            optionBtn.hidden = YES;
            break;
        }
    }
    BOOL isFull = YES;
    NSMutableString * answer = [NSMutableString string];
    for (UIButton *answerBtn in [self.answerView subviews]) {
        if (answerBtn.currentTitle == nil) {
            isFull = NO;
            break;
        }else{
            [answer appendString:answerBtn.currentTitle];
        }
    }
    if(isFull){
        Question *question = self.questions[self.index];
        int score = [self.scoreBtn.currentTitle intValue];
        if ([answer isEqualToString:question.answer]) {
            for (UIButton *answerBtn in [self.answerView subviews]) {
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            score += 1000;
            [self.scoreBtn setTitle:[NSString stringWithFormat:@"%d",score] forState:UIControlStateNormal];
            
            [self performSelector:@selector(clickNextBtn) withObject:nil afterDelay:0.5];
        }else{
            score -= 1000;
            [self.scoreBtn setTitle:[NSString stringWithFormat:@"%d",score] forState:UIControlStateNormal];
            for (UIButton *answerBtn in [self.answerView subviews]) {
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            }
        }
    }
}

- (void) settingAnswerBtn:(Question *)question{
    for (UIView *view in [self.answerView subviews]) {
        [view removeFromSuperview];
    }
    
    CGFloat btnX = 35;
    CGFloat btnD = 8;
    CGFloat xdist = (self.view.frame.size.width - question.answer.length *(btnX + btnD) + btnD) * 0.5;
    for(int i = 0; i < question.answer.length; i++){
        ChooseBtnView *answerBtn = [ChooseBtnView chooseAnswerBtnWithString:nil];
        answerBtn.frame = CGRectMake(xdist + i * (btnD + btnX), 0, btnX, btnX);
        [answerBtn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.answerView addSubview:answerBtn];
    }
}

- (void) answerClick:(UIButton *)answerBtn{
    if(answerBtn.currentTitle != nil){
        for (UIButton *optionBtn in [self.optionView subviews]) {
            if(optionBtn.currentTitle == answerBtn.currentTitle && optionBtn.hidden == YES){
                optionBtn.hidden = NO;
                [answerBtn setTitle:nil forState:UIControlStateNormal];
                break;
            }
        }
        for (UIButton *answerBtn in [self.answerView subviews]) {
            [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        }
    }
}

- (void) promptClick{
    for(UIButton *answerBtn in [self.answerView subviews]){
        [self answerClick:answerBtn];
    }
    Question *question = self.questions[self.index];
    NSString *promptWord = [question.answer substringToIndex:1];
    for(UIButton *optionBtn in [self.optionView subviews]){
        if([optionBtn.currentTitle isEqualToString:promptWord]){
            [self optionClick:optionBtn];
        }
    }
    int score = [self.scoreBtn.currentTitle intValue];
    [self.scoreBtn setTitle:[NSString stringWithFormat:@"%d",score - 500] forState:UIControlStateNormal];
}

- (void) settingData:(Question *)question{
    self.numLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index + 1,(unsigned long)self.questions.count];
    self.descLabel.text = question.title;
    [self.imgBtn setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    [self.imgBtn setImage:[UIImage imageNamed:question.icon] forState:UIControlStateHighlighted];
}

- (void) biggerPic{
    self.coverBtn.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.imgBtn.frame = CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.width);
        self.coverBtn.alpha = 0.5;
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void) smallerPic{
    [UIView animateWithDuration:0.3 animations:^{
        self.imgBtn.frame = CGRectMake(85, 85, 150, 150);
        self.coverBtn.alpha = 0;
    } completion:^(BOOL finished) {
        self.coverBtn.hidden = YES;
    }];
}

- (void) changeImgSize{
    if (self.coverBtn.isHidden) {
        [self biggerPic];
    }else{
        [self smallerPic];
    }
}

- (void) createView{
    UIImageView *backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [backgroundView setImage:[UIImage imageNamed:@"bj"]];
    [self.view addSubview:backgroundView];
    
    UIButton *promptBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 70, 36)];
    [self.view addSubview:promptBtn];
    [promptBtn setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
    [promptBtn setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:UIControlStateHighlighted];
    [promptBtn setTitle:@"提示" forState:UIControlStateNormal];
    [promptBtn setTitle:@"提示" forState:UIControlStateHighlighted];
    [promptBtn addTarget:self action:@selector(promptClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bigBtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 100, 70, 36)];
    [self.view addSubview:bigBtn];
    [bigBtn setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
    [bigBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
    [bigBtn setTitle:@"大图" forState:UIControlStateNormal];
    [bigBtn setTitle:@"大图" forState:UIControlStateHighlighted];
    [bigBtn addTarget:self action:@selector(changeImgSize) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *helpBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 170, 70, 36)];
    [self.view addSubview:helpBtn];
    [helpBtn setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
    [helpBtn setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:UIControlStateHighlighted];
    [helpBtn setTitle:@"帮助" forState:UIControlStateNormal];
    [helpBtn setTitle:@"帮助" forState:UIControlStateHighlighted];
    
    
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 170, 70, 36)];
    [self.view addSubview:nextBtn];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
    [nextBtn setTitle:@"下一题" forState:UIControlStateNormal];
    [nextBtn setTitle:@"下一题" forState:UIControlStateHighlighted];
    [nextBtn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.scoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(240, 20, 80, 20)];
    [self.view addSubview:self.scoreBtn];
    [self.scoreBtn setImage:[UIImage imageNamed:@"coin"] forState:UIControlStateNormal];
    [self.scoreBtn setUserInteractionEnabled:NO];
    [self.scoreBtn setTitle:@"10000" forState:UIControlStateNormal];
    
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 25)];
    [self.view addSubview:self.numLabel];
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.textColor = [UIColor whiteColor];
    
    self.descLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, self.view.frame.size.width, 35)];
    [self.view addSubview:self.descLabel];
    self.descLabel.textAlignment = NSTextAlignmentCenter;
    self.descLabel.textColor = [UIColor whiteColor];
    
    self.answerView = [[UIView alloc]initWithFrame:CGRectMake(0, 245, self.view.frame.size.width, 35)];
    [self.view addSubview:self.answerView];
    
    self.optionView = [[UIView alloc]initWithFrame:CGRectMake(0, 290, self.view.frame.size.width, 278)];
    [self.view addSubview:self.optionView];
    
    self.coverBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.coverBtn];
    self.coverBtn.backgroundColor = [UIColor blackColor];
    self.coverBtn.alpha = 0;
    self.coverBtn.hidden = YES;
    [self.coverBtn addTarget:self action:@selector(changeImgSize) forControlEvents:UIControlEventTouchUpInside];
    
    self.imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(85, 85, 150, 150)];
    [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"center_img"] forState:UIControlStateNormal];
    [self.imgBtn setAdjustsImageWhenHighlighted:NO];
    [self.imgBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.imgBtn addTarget:self action:@selector(changeImgSize) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imgBtn];
}

- (NSArray *)questions{
    if (_questions == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
        NSArray *dicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr = [NSMutableArray array];
        for(NSDictionary *dict in dicts){
            [tempArr addObject:[[Question alloc]initWithDict:dict]];
        }
        _questions = tempArr;
    }
    return _questions;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}





@end
