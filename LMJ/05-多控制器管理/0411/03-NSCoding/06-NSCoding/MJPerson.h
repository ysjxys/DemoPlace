//
//  MJPerson.h
//  06-NSCoding
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPerson : NSObject <NSCoding>
@property (nonatomic, copy) NSString *name;
@end
