//
//  Student.h
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "Person.h"

@interface Student : Person
{
    @protected
    int _studyNum;
}

- (Student *) initWithName:(NSString *)name andAge:(int)age andStudyNum:(int)studyNum;

@property int studyNum;

@end
