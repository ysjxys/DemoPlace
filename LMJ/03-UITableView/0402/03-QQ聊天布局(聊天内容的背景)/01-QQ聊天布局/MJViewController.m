//
//  MJViewController.m
//  01-QQ聊天布局
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJMessage.h"
#import "MJMessageFrame.h"
#import "MJMessageCell.h"

@interface MJViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *messageFrames;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 去除分割线
    self.tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO; // 不允许选中
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil]];
        
        NSMutableArray *mfArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            // 消息模型
            MJMessage *msg = [MJMessage messageWithDict:dict];
            
            // 取出上一个模型
            MJMessageFrame *lastMf = [mfArray lastObject];
            MJMessage *lastMsg = lastMf.message;
            
            // 判断两个消息的时间是否一致
            msg.hideTime = [msg.time isEqualToString:lastMsg.time];
            
            // frame模型
            MJMessageFrame *mf = [[MJMessageFrame alloc] init];
            mf.message = msg;
            
            // 添加模型
            [mfArray addObject:mf];
        }
        
        _messageFrames = mfArray;
    }
    return _messageFrames;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJMessageCell *cell = [MJMessageCell cellWithTableView:tableView];
    
    // 2.给cell传递模型
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    // 3.返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJMessageFrame *mf = self.messageFrames[indexPath.row];
    return mf.cellHeight;
}
@end
