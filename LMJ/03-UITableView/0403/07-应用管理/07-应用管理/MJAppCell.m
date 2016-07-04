//
//  MJAppCell.m
//  07-应用管理
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJAppCell.h"
#import "MJApp.h"

@interface MJAppCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIButton *downloadView;
@property (weak, nonatomic) IBOutlet UILabel *introView;
- (IBAction)downloadClick:(UIButton *)btn;
@end

@implementation MJAppCell

- (void)setApp:(MJApp *)app
{
    _app = app;
    
    self.iconView.image = [UIImage imageNamed:app.icon];
    self.nameView.text = app.name;
    self.introView.text = [NSString stringWithFormat:@"大小:%@ | 下载量:%@", app.size, app.download];
    
    // 覆盖按钮的状态
    self.downloadView.enabled = (self.app.isDownloaded == NO);
}
/**
 *  点击了下载按钮
 */
- (IBAction)downloadClick:(UIButton *)btn {
    // 1.让按钮失效
    self.app.downloaded = YES;
    btn.enabled = NO;
    
    // 2.通知代理
    if ([self.delegate respondsToSelector:@selector(appCellDidClickedDownloadBtn:)]) {
        [self.delegate appCellDidClickedDownloadBtn:self];
    }
}
@end
