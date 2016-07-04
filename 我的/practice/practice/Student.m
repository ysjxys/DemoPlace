//
//  Student.m
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Student.h"

@implementation Student

- (Student *) initWithName:(NSString *)name andAge:(int)age andStudyNum:(int)studyNum{
    super.name = name;
    super.age = age;
    self.studyNum = studyNum;
    return self;
}
@end
