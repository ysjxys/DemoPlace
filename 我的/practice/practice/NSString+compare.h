//
//  NSString+compare.h
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (compare)

- (int) numOfEnglishChar;
+ (int) numOfEnglishChar:(NSString *)str;

- (int) differenceBetweenNSString:(NSString *)s;
+ (int) differenceBetweenNSStringA:(NSString *)s1 andNSStringB:(NSString *)s2;
@end
