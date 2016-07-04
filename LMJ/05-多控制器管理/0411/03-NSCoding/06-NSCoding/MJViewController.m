//
//  MJViewController.m
//  06-NSCoding
//
//  Created by apple on 14-4-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJStudent.h"

#define MJPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"stu.data"]

@interface MJViewController ()
- (IBAction)save;
- (IBAction)read;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)save {
    // 1.新的模型对象
    MJStudent *stu = [[MJStudent alloc] init];
    stu.no = @"42343254";
    stu.age = 20;
    stu.height = 1.55;
    stu.name = @"jack";
    
    // 2.归档模型对象
    [NSKeyedArchiver archiveRootObject:stu toFile:MJPath];
}

- (IBAction)read {
    // 从文件中读取MJStudent对象
    MJStudent *stu = [NSKeyedUnarchiver unarchiveObjectWithFile:MJPath];
    
    NSLog(@"%@ %@ %d %f", stu.name, stu.no, stu.age, stu.height);
}
@end
