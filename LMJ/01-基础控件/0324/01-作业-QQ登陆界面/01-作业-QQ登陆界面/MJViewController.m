//
//  MJViewController.m
//  01-作业-QQ登陆界面
//
//  Created by apple on 14-3-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()
@property (weak, nonatomic) IBOutlet UITextField *qqField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
- (IBAction)login;
@end

@implementation MJViewController


- (IBAction)login {
    NSLog(@"%@ - %@", self.qqField.text, self.pwdField.text);
    
    [self.view endEditing:YES];
}
@end
