//
//  Person.h
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @protected
    NSString *_name;
    int _age;
    int _height;
}


- (Person *) initWithName:(NSString *)name andAge:(int)age andHeight:(int)height;
- (Person *) initWithName:(NSString *)name andAge:(int)age;

@property NSString *name;
@property int age;
@property int height;
@end
