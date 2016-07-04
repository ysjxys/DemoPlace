//
//  main.m
//  02-KVC
//
//  Created by apple on 14-3-27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Book *book = [[Book alloc] init];
        book.name = @"葵花宝典";
        
        Person *person = [[Person alloc] init];
        person.name = @"Jack";
        person.age = 5;
        person.book = book;
        
        NSString *bn = [person valueForKeyPath:@"book.name"];
        
//        NSLog(@"%@", bn);
//        [person.book valueForKeyPath:@"name"];
        
//        NSLog(@"%@", person.book.name);
    }
    return 0;
}

void test()
{
    Person *p = [[Person alloc] init];
    p.name = @"Jack";
    p.age = 10;
    
    Person *p1 = [[Person alloc] init];
    p1.name = @"Rose";
    p1.age = 40;
    
    Person *p2 = [[Person alloc] init];
    p2.name = @"Jim";
    p2.age = 19;
    
    NSArray *persons = @[p, p1, p2];
    // 取出persons数组中所有person对象的name属性值
    NSArray *names = [persons valueForKeyPath:@"name"];
    
    //        NSMutableArray *names = [NSMutableArray array];
    //        for (Person *person in persons) {
    //            [names addObject:person.name];
    //        }
    
    NSLog(@"%@", names);
    
    
    //        [p setValue:@"Jack" forKeyPath:@"name"];
    //        [p setValue:@"50" forKeyPath:@"age"];
    
    //        NSString *name = [p valueForKeyPath:@"name"];
    //        int age = [[p valueForKeyPath:@"age"] intValue];
    //        NSDictionary *dict = [p dictionaryWithValuesForKeys:@[@"name"]];
    //        NSLog(@"-------%@", dict);
}

