//
//  MJViewController.m
//  08-plist处理
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"

@interface MJViewController ()

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *apps = @[
  @{@"name":@"敌法师", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/dfss.jpg"},
  @{@"name":@"火枪", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/arjj.jpg"},
  @{@"name":@"德鲁伊", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/dlyy.jpg"},
  @{@"name":@"月骑", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/yzqs.jpg"},
  @{@"name":@"变体精灵", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/btjl.jpg"},
  @{@"name":@"娜迦海妖", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/njhy.gif"},
  @{@"name":@"猴子", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/hycm.jpg"},
  @{@"name":@"白虎", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/yzjs.jpg"},
  @{@"name":@"隐形刺客", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/yxck.jpg"},
  @{@"name":@"巨魔", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/jmzj.jpg"},
  @{@"name":@"直升机", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/arzs.jpg"},
  @{@"name":@"赏金猎人", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Naka.gif"},
  @{@"name":@"骷髅射手", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/KLSS.gif"},
  @{@"name":@"育母蜘蛛", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/YMZZ.gif"},
  @{@"name":@"血魔", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/XM.gif"},
  @{@"name":@"黑暗游侠", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Nbrn.gif"},
  @{@"name":@"虚空假面", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/EC45.gif"},
  @{@"name":@"蛇发女妖", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/H00V.gif"},
  @{@"name":@"地卜师", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/H00I.gif"},
  @{@"name":@"地穴刺客", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/DXCK.gif"},
  @{@"name":@"蚂蚁", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/DXBZ.gif"},
  @{@"name":@"幻影刺客", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/HYCK.gif"},
  @{@"name":@"闪电幽魂", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/E002.gif"},
  @{@"name":@"影魔", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/YM01.gif"},
  @{@"name":@"小鱼人", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/yryx.gif"},
  @{@"name":@"幽鬼", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/YG1.gif"},
  @{@"name":@"圣堂刺客", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/E01Y.gif"},
  @{@"name":@"灵魂守卫", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/LHSW.gif"},
  @{@"name":@"熊战士", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Huth.gif"},
  @{@"name":@"剧毒术士", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/JDSS.gif"},
  @{@"name":@"冥界亚龙", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/MJYL.gif"},
  @{@"name":@"复仇之魂", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/Hvwd.jpg"},
  @{@"name":@"剑圣", @"icon":@"http://dotadb.uuu9.com/UploadFiles/Dota/Hero/jsjs.jpg"}
  ];
    
//    for (NSDictionary *dict in apps) {
//        NSString *icon = dict[@"icon"];
//        
//        // 新建网络图片的URL路径
//        NSURL *url = [NSURL URLWithString:icon];
//        
//        // 下载图片的二进制数据
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        
//        // 截取文件名
//        NSString *filename = [icon lastPathComponent];
//        
//        // 文件路径
//        NSString *iconPath = [NSString stringWithFormat:@"/Users/aplle/Documents/Icons/%@", filename];
//        
//        [data writeToFile:iconPath atomically:YES];
//    }
    
    NSMutableArray *newApps = [NSMutableArray array];
    for (NSDictionary *dict in apps) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        newDict[@"name"] = dict[@"name"];
        newDict[@"icon"] = [dict[@"icon"] lastPathComponent];
        [newApps addObject:newDict];
    }
    
    [newApps writeToFile:@"/Users/aplle/Documents/heros.plist" atomically:YES];
}

@end
