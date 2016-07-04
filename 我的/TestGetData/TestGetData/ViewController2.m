//
//  ViewController2.m
//  TestGetData
//
//  Created by ysj on 15/8/16.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@{@"name":@"斧王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/FW.gif"},
                     @{@"name":@"钢背兽",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/H008.jpg"},
                     @{@"name":@"兽王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/swsw.jpg"},
                     @{@"name":@"发条",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/FTDJ.gif"},
                     @{@"name":@"混沌骑士",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/hdqs.gif"},
                     @{@"name":@"船长",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/CZCZ.jpg"},
                     @{@"name":@"人马",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/brmm.jpg"},
                     @{@"name":@"龙骑士",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Hlgr.gif"},
                     @{@"name":@"末日守卫",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/mrsz.gif"},
                     @{@"name":@"撼地神牛",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/hdsn.jpg"},
                     @{@"name":@"凤凰",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/hzfh.gif"},
                     @{@"name":@"炼金",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/N01H.jpg"},
                     @{@"name":@"神灵",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/H00Q.gif"},
                     @{@"name":@"海牙",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/jyhm.jpg"},
                     @{@"name":@"地狱领主",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/DXLZ.gif"},
                     @{@"name":@"狼人",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Bane.gif"},
                     @{@"name":@"猛犸",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/UC11.gif"},
                     @{@"name":@"食尸鬼",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Naix.gif"},
                     @{@"name":@"夜魔",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/AYMW.gif"},
                     @{@"name":@"全能骑士",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/qnqs.gif"},
                     @{@"name":@"熊猫酒仙",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/xmjx.gif"},
                     @{@"name":@"深渊魔王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/SYLZ.gif"},
                     @{@"name":@"裂魂人",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/O00J.jpg"},
                     @{@"name":@"鱼人守卫",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/XESW.gif"},
                     @{@"name":@"沙王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/U00K.gif"},
                     @{@"name":@"骷髅王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/klw.gif"},
                     @{@"name":@"流浪剑客",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/lljk.jpg"},
                     @{@"name":@"牛头人",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/ntrr.jpg"},
                     @{@"name":@"屠夫",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/U00F.gif"},
                     @{@"name":@"潮汐",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Ofar.gif"},
                     @{@"name":@"山岭",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/sljr.jpg"},
                     @{@"name":@"树精",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/sjws.gif"},
                     @{@"name":@"尸王",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/BXSW.gif"},
                     @{@"name":@"精灵守卫",@"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/jlsw.jpg"}];
    
    for (NSDictionary *dict in arr) {
        NSString *icon = dict[@"icon"];
        // 新建网络图片的URL路径
        NSURL *url = [NSURL URLWithString:icon];
        // 下载图片的二进制数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 截取文件名
        NSString *filename = [icon lastPathComponent];
        // 文件路径
        NSString *iconPath = [NSString stringWithFormat:@"/Users/ysj/Desktop/apps/TestGetData/TestGetData/Icons/%@", filename];
        [data writeToFile:iconPath atomically:YES];
    }
    
    NSMutableArray *newApps = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        newDict[@"name"] = dict[@"name"];
        newDict[@"icon"] = [dict[@"icon"] lastPathComponent];
        [newApps addObject:newDict];
    }
    
    [newApps writeToFile:@"/Users/ysj/Desktop/apps/TestGetData/TestGetData/apps.plist" atomically:YES];
}

@end
