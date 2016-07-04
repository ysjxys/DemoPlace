//
//  Record.m
//  TelephoneNote
//
//  Created by ysj on 15/7/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Record.h"

@implementation Record

-(void)encodeWithCoder:(NSCoder *)enCoder{
    [enCoder encodeObject:self.name forKey:@"name"];
    [enCoder encodeObject:self.telephoneNum forKey:@"telephoneNum"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.telephoneNum = [decoder decodeObjectForKey:@"telephoneNum"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

@end
