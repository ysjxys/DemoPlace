//
//  circle.h
//  practice
//
//  Created by ysj on 15/5/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "centerPoint.h"

@interface circle : NSObject

@property centerPoint* cp;
@property double radius;

+ (BOOL) isOverlapBetweenCircleA:(circle *)c1 andCircelB:(circle *)c2;
@end
