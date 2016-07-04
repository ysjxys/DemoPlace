//
//  centerPoint.h
//  practice
//
//  Created by ysj on 15/5/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface centerPoint : NSObject

@property double xPlace;
@property double yPlace;

+ (double) distanceBetweenPointA:(centerPoint *)cp1 andPointB:(centerPoint *)cp2;
@end
