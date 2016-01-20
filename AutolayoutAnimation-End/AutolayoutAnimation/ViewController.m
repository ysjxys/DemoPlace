//
//  ViewController.m
//  AutolayoutAnimation
//
//  Created by Puzhi Li on 15/6/18.
//  Copyright (c) 2015年 Puzhi Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPwdTextField;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPwdLabel;

//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userNamePwdLabelTopCons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelCenterYNormalCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelCenterYKeyboardCons;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIView* headImageView = [self.view viewWithTag:99];
    
    for (NSLayoutConstraint* eachCon in headImageView.constraints)
    {
        NSLog(@"\n%@\nPriority:%f", eachCon, eachCon.priority);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWillShow:(NSNotification *)notification
{
//    //在键盘弹出时，文本控件顶部距离Top Layout Guide的垂直间距为0
//    self.userNamePwdLabelTopCons.constant = 0.0f;
    
//    self.labelCenterYNormalCons.active = NO;
//    self.labelCenterYKeyboardCons.active = YES;
    
    self.labelCenterYNormalCons.priority = UILayoutPriorityDefaultLow;
    self.labelCenterYKeyboardCons.priority = UILayoutPriorityDefaultHigh;
    
//    [UIView animateWithDuration:0.25f animations:^
//    {
//        [self.view layoutIfNeeded];
//    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
//    //键盘未弹出时，文本控件顶部距离Top Layout Guide的垂直间距为250
//    self.userNamePwdLabelTopCons.constant = 250.0f;
    
//    self.labelCenterYKeyboardCons.active = NO;
//    self.labelCenterYNormalCons.active = YES;
    
    self.labelCenterYKeyboardCons.priority = UILayoutPriorityDefaultLow;
    self.labelCenterYNormalCons.priority = UILayoutPriorityDefaultHigh;
    
//    [UIView animateWithDuration:0.25f animations:^
//     {
//         [self.view layoutIfNeeded];
//     }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (IBAction)loginButtonClick:(id)sender
{
    self.userNameLabel.text = [NSString stringWithFormat:@"您输入的用户名是：%@", self.userNameTextField.text];
    self.userPwdLabel.text = [NSString stringWithFormat:@"您输入的密码是：%@", self.userPwdTextField.text];
}

#pragma mark - Touch event Handler
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self.userNameTextField resignFirstResponder];
    [self.userPwdTextField resignFirstResponder];
}
@end
