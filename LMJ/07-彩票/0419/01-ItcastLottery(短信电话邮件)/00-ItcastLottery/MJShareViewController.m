//
//  MJShareViewController.m
//  00-ItcastLottery
//
//  Created by apple on 14-4-19.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJShareViewController.h"
#import "MJSettingArrowItem.h"
#import "MJSettingGroup.h"
#import <MessageUI/MessageUI.h>

@interface MJShareViewController () <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation MJShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MJSettingItem *sina = [MJSettingArrowItem itemWithIcon:nil title:@"新浪微博" destVcClass:nil];
    MJSettingItem *sms = [MJSettingArrowItem itemWithIcon:nil title:@"短信分享" destVcClass:nil];
    sms.option = ^{
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        // 设置短信内容
        vc.body = @"吃饭了没？";
        // 设置收件人列表
        vc.recipients = @[@"10010", @"02010010"];
        // 设置代理
        vc.messageComposeDelegate = self;
        
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];

//        NSURL *url = [NSURL URLWithString:@"sms://10010"];
//        [[UIApplication sharedApplication] openURL:url];
    };
    MJSettingItem *mail = [MJSettingArrowItem itemWithIcon:nil title:@"邮件分享" destVcClass:nil];
    mail.option = ^{
        // 不能发邮件
//        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"lufy.png"];
        NSData *data = UIImagePNGRepresentation(image);
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"lufy.png"];
        
        // 设置代理
        vc.mailComposeDelegate = self;
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];
    };
    
    
    MJSettingGroup *group = [[MJSettingGroup alloc] init];
    group.items = @[sina, sms, mail];
    [self.data addObject:group];
}

/**
 *  点击取消按钮会自动调用
 */
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
