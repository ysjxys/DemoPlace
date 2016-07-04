//
//  Record.h
//  TelephoneNote
//
//  Created by ysj on 15/7/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject<NSCoding>


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *telephoneNum;

@end
