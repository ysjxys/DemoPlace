//
//  NSString+compare.m
//  practice
//
//  Created by ysj on 15/5/7.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "NSString+compare.h"
#import "math.h"

@implementation NSString (compare)

- (int) numOfEnglishChar
{
    int sum = 0;
    for(int i = 0; i < self.length; i++){
        char c = [self characterAtIndex:i];
        if(c >= 'A' && c <= 'z'){
            sum++;
        }
    }
    return  sum;
}

+ (int) numOfEnglishChar:(NSString *)str
{
    return [str numOfEnglishChar];
}

- (int) differenceBetweenNSString:(NSString *)s
{
    return [NSString differenceBetweenNSStringA:self andNSStringB:s];
}

+ (int) differenceBetweenNSStringA:(NSString *)s1 andNSStringB:(NSString *)s2
{
    return (int)(s1.length - s2.length);
}

@end
