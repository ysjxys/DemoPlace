//
//  centerPoint.m
//  practice
//
//  Created by ysj on 15/5/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "centerPoint.h"


@implementation centerPoint

+ (double) distanceBetweenPointA:(centerPoint *)cp1 andPointB:(centerPoint *)cp2
{
    double xDistance = [cp1 xPlace] - [cp2 xPlace];
    double yDistance = [cp1 yPlace] - [cp2 yPlace];
    return sqrt(pow(xDistance, 2) + pow(yDistance, 2));
   
}

@end
