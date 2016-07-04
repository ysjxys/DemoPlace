//
//  main.m
//  10-strong和weak
//
//  Created by apple on 14-4-11.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
//    __weak Person *p2;
    
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.dog = [[Dog alloc] init];
        p.dog.owner = p;
    }
    return 0;
}

void test()
{
    
    __weak Person *p = [[Person alloc] init];
    
    
    NSLog(@"-----");
    // 强指针:默认情况下,任何指针都是强指针
    // 弱指针:使用__weak修饰的指针
    
    // ARC准则:只要没有强指针指向对象,那么这个对象就会被销毁
    
    //        p2 = p;
}

