//
//  main.m
//  01-Block
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int MyInt;

typedef int (^MyBlock)(int, int);

void play()
{
    NSLog(@"play mp3");
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
//        void (^block)() =  ^{
//            NSLog(@"fhdaskhjfhjdsf");
//            NSLog(@"fhdaskhjfhjdsf4324");
//            NSLog(@"fhdaskhjfhjdsf6546");
//            NSLog(@"fhdaskhjfhjdsf8768");
//        };
        
        MyBlock sumBlock =  ^(int a, int b){
            return  a + b;
        };
        
        MyBlock minusBlock =  ^(int a, int b){
            return  a - b;
        };
        
        int r = minusBlock(10, 2);
        
        NSLog(@"%d", r);
    }
    return 0;
}

