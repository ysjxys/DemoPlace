//
//  main.m
//  practice
//
//  Created by ysj on 15/5/5.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "circle.h"
#import <math.h>
#import "centerPoint.h"
#import "Person.h"
#import "Student.h"
#import "Student+quit.h"
#import "NSString+compare.h"

void work0808(){
    
}

void work0807(){
    
}

int main(int argc, const char * argv[]) {
//    NSLog(@"-------------------work0807-----------------");
//    circle *c1 = [circle new];
//    
//    centerPoint *cp1 = [centerPoint new];
//    cp1.xPlace = 0;
//    cp1.yPlace = 0;
//    
//    c1.radius = 2;
//    c1.cp = cp1;
//    
//    
//    circle *c2 = [circle new];
//    
//    centerPoint *cp2 = [centerPoint new];
//    cp2.xPlace = 0;
//    cp2.yPlace = 4;
//    
//    c2.radius = 2;
//    c2.cp = cp2;
//    
//    double distance = [centerPoint distanceBetweenPointA:cp1 andPointB:cp2];
//    NSLog(@"两个圆圆心距离为%f",distance);
//    NSLog(@"两个圆重叠结果为%@",[circle isOverlapBetweenCircleA:c1 andCircelB:c2]?@"YES":@"NO");
    
    NSLog(@"-------------------work0808-----------------");
    Person *p = [[Person alloc]initWithName:@"Jack" andAge:(30) andHeight:150];
    NSLog(@"%@  %d  %d", p.name, p.age, p.height);
    
    Student *s = [[Student alloc]initWithName:(@"name") andAge:9];
    NSLog(@"%@  %i  %i", s.name, s.age, s.height);
    
    NSLog(@"%@ %@",[Student className],[s className]);
    
    NSLog(@"%i",[@"12sqdjNAJCN" numOfEnglishChar]);
    NSLog(@"%i",[NSString numOfEnglishChar:@"12sqdjNAJCN"]);
    NSLog(@"%i",[NSString differenceBetweenNSStringA:@"111" andNSStringB:@"hahaha"] );
    NSLog(@"%i",[@"111" differenceBetweenNSString:@"hahaha"]);
    
    return 0;
}


