//
//  Person.h
//  04-通知
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
/**
 * 姓名
 */
@property (nonatomic, copy) NSString *name;

- (void)newsCome:(NSNotification *)note;
@end
