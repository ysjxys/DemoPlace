//
//  AboutViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/25.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "AboutViewController.h"
#import "SettingGroup.h"
#import "SettingBasicItem.h"
#import "SettingArrowItem.h"
#import <MessageUI/MessageUI.h>

@interface AboutViewController()<MFMessageComposeViewControllerDelegate>

@end

@implementation AboutViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    __unsafe_unretained typeof(self) selfVC = self;
//    [self setGroup0:selfVC];
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:webView];
    
    SettingGroup *group0 = [[SettingGroup alloc]init];
    SettingBasicItem *score = [SettingArrowItem itemWithTitle:@"评分支持"];
    score.option = ^{
        if ([MFMessageComposeViewController canSendText]) {
            MFMessageComposeViewController *msgVC = [[MFMessageComposeViewController alloc]init];
            msgVC.recipients = @[@"10086",@"10000"];
            msgVC.body = @"短信内容";
            msgVC.messageComposeDelegate = selfVC;
            [selfVC presentViewController:msgVC animated:YES completion:nil];
        }
    };
    SettingBasicItem *telephone = [SettingArrowItem itemWithTitle:@"客户电话"];
    NSString *telephoneNum = @"10000";
    telephone.subTitle = telephoneNum;
    telephone.option = ^{
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", telephoneNum]];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    group0.items = @[score,telephone];
    [self.data addObject:group0];
}

- (void)setGroup0:(id)selfVC{
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    NSLog(@"AboutViewController  OVER");
}
@end
