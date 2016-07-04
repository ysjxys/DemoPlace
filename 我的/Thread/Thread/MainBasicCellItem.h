//
//  MainBasicCell.h
//  Thread
//
//  Created by ysj on 15/8/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MainCellItemOption)();
@interface MainBasicCellItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) MainCellItemOption option;


+ (instancetype)itemWithTitle:(NSString *)title;
@end
