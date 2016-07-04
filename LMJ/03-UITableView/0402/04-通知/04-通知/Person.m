//
//  Person.m
//  04-通知
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "Person.h"
#import "NewsCompany.h"

@implementation Person
- (void)newsCome:(NSNotification *)note
{
    // 通知的发布者
    NewsCompany *obj = note.object;
    
    NSLog(@"%@接收到了%@发出的通知,通知内容是:%@", self.name, obj.name, note.userInfo);
}

- (void)dealloc
{
//    [super dealloc];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
