//
//  MJViewController.m
//  01-传智猜图
//
//  Created by apple on 14-3-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJQuestion.h"

@interface MJViewController ()
- (IBAction)tip;
- (IBAction)bigImg;
- (IBAction)help;
- (IBAction)nextQuestion;
- (IBAction)iconClick;
@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;

/** 存放正确答案按钮的view */
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;


/** 序号 */
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** 头像(图标) */
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
/** 下一题按钮 */
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionBtn;

/** 遮盖 */
@property (nonatomic, weak) UIButton *cover;

/** 所有的题目 */
@property (nonatomic, strong) NSArray *questions;

/** 当前是第几题(当前题目的序号) */
@property (nonatomic, assign) int index;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 默认显示index=0对应的题目
    self.index = -1;
    [self nextQuestion];
}

- (NSArray *)questions
{
    if (_questions == nil) {
        // 1.加载plist
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"]];
        
        // 2.字典转模型
        NSMutableArray *questionArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJQuestion *question = [MJQuestion questionWithDict:dict];
            [questionArray addObject:question];
        }
        
        // 3.赋值
        _questions = questionArray;
    }
    return _questions;
}

/**
 *  控制状态栏的样式
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    // 白色
    return UIStatusBarStyleLightContent;
}

/**
 *  下一题
 */
- (IBAction)nextQuestion {
    // 1.增加索引
    self.index++;
    
    // 2.取出模型
    MJQuestion *question = self.questions[self.index];
    
    // 3.设置控件的数据
    [self settingData:question];
    
    // 4.添加正确答案
    [self addAnswerBtn:question];
    
    // 5.添加待选项
    [self addOptionBtn:question];
}

/**
 *  设置控件的数据
 */
- (void)settingData:(MJQuestion *)question
{
    // 3.1.设置序号
    self.noLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, self.questions.count];
    
    // 3.2.设置标题
    self.titleLabel.text = question.title;
    
    // 3.3.设置图片
    [self.iconBtn setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
    // 3.4.设置下一题按钮的状态
    self.nextQuestionBtn.enabled = self.index != (self.questions.count - 1);
}

/**
 *  添加待选项
 */
- (void)addOptionBtn:(MJQuestion *)question
{
    // 6.1.删掉之前的所有按钮
    for (UIView *subview in self.optionView.subviews) {
        [subview removeFromSuperview];
    }
    
    // 6.2.添加新的待选按钮
    int count = question.options.count;
    for (int i = 0; i<count; i++) {
        // 6.2.1.创建按钮
        UIButton *optionBtn = [[UIButton alloc] init];
        
        // 6.2.2.设置背景
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        
        // 6.2.3.设置frame
        // 按钮尺寸
        CGFloat optionW = 35;
        CGFloat optionH = 35;
        // 按钮之间的间距
        CGFloat margin = 10;
        // 控制器view的宽度
        CGFloat viewW = self.view.frame.size.width;
        // 总列数
        int totalColumns = 7;
        // 最左边的间距 = 0.5 * (控制器view的宽度 - 总列数 * 按钮宽度 - (总列数 - 1) * 按钮之间的间距)
        CGFloat leftMargin = (viewW - totalColumns * optionW - margin * (totalColumns - 1)) * 0.5;
        int col = i % totalColumns;
        // 按钮的x = 最左边的间距 + 列号 * (按钮宽度 + 按钮之间的间距)
        CGFloat optionX = leftMargin + col * (optionW + margin);
        int row = i / totalColumns;
        // 按钮的y = 行号 * (按钮高度 + 按钮之间的间距)
        CGFloat optionY = row * (optionH + margin);
        optionBtn.frame = CGRectMake(optionX, optionY, optionW, optionH);
        
        // 6.2.4.设置文字
        [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 6.2.5.添加
        [self.optionView addSubview:optionBtn];
        
        // 6.2.6.监听点击
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
 *  监听待选按钮的点击
 */
- (void)optionClick:(UIButton *)optionBtn
{
    // 1.让被点击的待选按钮消失
    optionBtn.hidden = YES;
    
    // 2.显示文字到正确答案上
    for (UIButton *answerBtn in self.answerView.subviews) {
        // 判断按钮是否有文字
        NSString *answerTitle = [answerBtn titleForState:UIControlStateNormal];
        
        if (answerTitle.length == 0) { // 没有文字
            // 设置答案按钮的 文字 为 被点击待选按钮的文字
            NSString *optionTitle = [optionBtn titleForState:UIControlStateNormal];
            [answerBtn setTitle:optionTitle forState:UIControlStateNormal];
            break; // 停止遍历
        }
    }
    
    // 3.检测答案是否填满
    BOOL full = YES;
    NSMutableString *tempAnswerTitle = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews) {
        // 判断按钮是否有文字
        NSString *answerTitle = [answerBtn titleForState:UIControlStateNormal];
        
        if (answerTitle.length == 0) { // 没有文字(按钮没有填满)
            full = NO;
        }
        
        // 拼接按钮文字
        if(answerTitle) {
            [tempAnswerTitle appendString:answerTitle];
        }
    }
    
    // 4.答案满了
    if (full) {
        MJQuestion *question = self.questions[self.index];
        
        if ([tempAnswerTitle isEqualToString:question.answer]) { // 答对了(文字显示蓝色)
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            
            // 加分
            int score = [self.scoreBtn titleForState:UIControlStateNormal].intValue;
            score += 1000;
            [self.scoreBtn setTitle:[NSString stringWithFormat:@"%d", score] forState:UIControlStateNormal];
            
            // 0.5秒后跳到下一题
            [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
        } else { // 答错了(文字显示红色)
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
        }
    }
}

/**
 *  添加正确答案
 */
- (void)addAnswerBtn:(MJQuestion *)question
{
    // 5.1.删除之前的所有按钮
    for (UIView *subview in self.answerView.subviews) {
        [subview removeFromSuperview];
    }
    
    // 5.2.添加新的答案按钮
    int length = question.answer.length;
    for (int i = 0; i<length; i++) {
        // 5.2.1.创建按钮
        UIButton *answerBtn = [[UIButton alloc] init];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 5.2.2.设置背景
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        
        // 5.2.3.设置frame
        CGFloat viewW = self.view.frame.size.width;
        // 按钮之间的间距
        CGFloat margin = 10;
        // 按钮的尺寸
        CGFloat answerW = 35;
        CGFloat answerH = 35;
        // 最左边的间距 = 0.5 * (控制器view的宽度 - 按钮个数 * 按钮宽度 - (按钮个数 - 1) * 按钮之间的间距)
        CGFloat leftMargin = (viewW - length * answerW - margin * (length - 1)) * 0.5;
        // 按钮的x = 最左边的间距 + i * (按钮宽度 + 按钮之间的间距)
        CGFloat answerX = leftMargin + i * (answerW + margin);
        answerBtn.frame = CGRectMake(answerX, 0, answerW, answerH);
        
        // 5.2.4.添加
        [self.answerView addSubview:answerBtn];
        
        // 5.2.5.监听点击
        [answerBtn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
 *  监听答案按钮的点击
 */
- (void)answerClick:(UIButton *)answerBtn
{
    // 答案按钮的文字
    NSString *answerTitle = [answerBtn titleForState:UIControlStateNormal];
    
    // 1.让答案按钮文字对应的待选按钮显示出来(hidden = NO)
    for (UIButton *optionBtn in self.optionView.subviews) {
        // 待选按钮的文字
        NSString *optionTitle = [optionBtn titleForState:UIControlStateNormal];
        
        if ([optionTitle isEqualToString:answerTitle]) { // 发现跟答案按钮相同文字的待选按钮
            optionBtn.hidden = NO;
            break;
        }
    }
    
    // 2.让被点击答案按钮的文字消失(去除文字)
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    
    // 3.让所有的答案按钮变为黑色
    for (UIButton *answerBtn in self.answerView.subviews) {
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

/**
 *  点击头像
 */
- (IBAction)iconClick {
    if (self.cover == nil) { // 没有遮盖,要放大
        [self bigImg];
    } else { // 有遮盖,要缩小
        [self smallImg];
    }
}

/**
 *  提示
 */
- (IBAction)tip {
    
}

/**
 *  大图
 */
- (IBAction)bigImg {
    // 1.添加阴影
    UIButton *cover = [[UIButton alloc] init];
    cover.frame = self.view.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.0;
    [cover addTarget:self action:@selector(smallImg) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cover];
    self.cover = cover;
    
    // 2.更换阴影和头像的位置
    [self.view bringSubviewToFront:self.iconBtn];
    
    // 3.执行动画
    [UIView animateWithDuration:0.25 animations:^{
        // 3.1.阴影慢慢显示出来
        cover.alpha = 0.7;
        
        // 3.2.头像慢慢变大,慢慢移动到屏幕的中间
        CGFloat iconW = self.view.frame.size.width;
        CGFloat iconH = iconW;
        CGFloat iconY = (self.view.frame.size.height - iconH) * 0.5;
        self.iconBtn.frame = CGRectMake(0, iconY, iconW, iconH);
    }];
}

/**
 *  小图
 */
- (void)smallImg
{
    // 执行动画
    [UIView animateWithDuration:0.25 animations:^{
        // 存放需要执行动画的代码
        
        // 1.头像慢慢变为原来的位置和尺寸
        self.iconBtn.frame = CGRectMake(85, 80, 150, 150);
        
        // 2.阴影慢慢消失
        self.cover.alpha = 0.0;
    } completion:^(BOOL finished) {
        // 动画执行完毕后会自动调用这个block内部的代码
        
        // 3.动画执行完毕后,移除遮盖(从内存中移除)
        [self.cover removeFromSuperview];
        self.cover = nil;
    }];
}

/**
 *  帮助
 */
- (IBAction)help {
    
}
@end
