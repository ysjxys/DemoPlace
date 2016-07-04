//
//  circle.m
//  practice
//
//  Created by ysj on 15/5/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "circle.h"
#import "centerPoint.h"

@implementation circle

+ (BOOL) isOverlapBetweenCircleA:(circle *)c1 andCircelB:(circle *)c2
{
    double distance = [centerPoint distanceBetweenPointA:c1.cp andPointB:c2.cp];
    double radiusSum = c1.radius + c2.radius;
    return distance < radiusSum;
}

@end
