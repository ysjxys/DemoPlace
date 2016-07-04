//
//  ViewController.m
//  TestGetData
//
//  Created by ysj on 15/6/24.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = @[@{@"name":@"北京大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_北京大学"},
  @{@"name":@"中国人民大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中国人民大学"},
  @{@"name":@"清华大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_清华大学"},
  @{@"name":@"北京交通大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京交通大学"},
  @{@"name":@"北京工业大学",@"kind":@"工科",@"manager":@"北京市",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京工业大学"},
  @{@"name":@"北京航空航天大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_北京航空航天大学"},
  @{@"name":@"北京理工大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_北京理工大学"},
  @{@"name":@"北京科技大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京科技大学"},
  @{@"name":@"北京化工大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京化工大学"},
  @{@"name":@"北京邮电大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京邮电大学"},
  @{@"name":@"中国农业大学",@"kind":@"农业",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中国农业大学"},
  @{@"name":@"北京林业大学",@"kind":@"林业",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京林业大学"},
  @{@"name":@"北京中医药大学",@"kind":@"医药",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京中医药大学"},
  @{@"name":@"北京师范大学",@"kind":@"师范",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_北京师范大学"},
  @{@"name":@"北京外国语大学",@"kind":@"语言",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京外国语大学"},
  @{@"name":@"中国传媒大学",@"kind":@"语言",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国传媒大学"},
  @{@"name":@"中央财经大学",@"kind":@"财经",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中央财经大学"},
  @{@"name":@"对外经济贸易大学",@"kind":@"财经",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_对外经济贸易大学"},
  @{@"name":@"北京体育大学",@"kind":@"体育",@"manager":@"国家体育总局",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_北京体育大学"},
  @{@"name":@"中央音乐学院",@"kind":@"艺术",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中央音乐学院"},
  @{@"name":@"中央民族大学",@"kind":@"民族",@"manager":@"国家民族事务委员会",@"province":@"北京",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中央民族大学"},
  @{@"name":@"中国政法大学",@"kind":@"政法",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国政法大学"},
  @{@"name":@"华北电力大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_华北电力大学"},
  @{@"name":@"南开大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"天津",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_南开大学"},
  @{@"name":@"天津大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"天津",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_天津大学"},
  @{@"name":@"天津医科大学",@"kind":@"医药",@"manager":@"天津市",@"province":@"天津",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_天津医科大学"},
  @{@"name":@"河北工业大学",@"kind":@"工科",@"manager":@"河北省",@"province":@"天津",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_河北工业大学"},
  @{@"name":@"太原理工大学",@"kind":@"工科",@"manager":@"山西省",@"province":@"山西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_太原理工大学"},
  @{@"name":@"内蒙古大学",@"kind":@"综合",@"manager":@"内蒙古自治区",@"province":@"内蒙古",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_内蒙古大学"},
  @{@"name":@"辽宁大学",@"kind":@"综合",@"manager":@"辽宁省",@"province":@"辽宁",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_辽宁大学"},
  @{@"name":@"大连理工大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"辽宁",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_大连理工大学"},
  @{@"name":@"东北大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"辽宁",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_东北大学"},
  @{@"name":@"大连海事大学",@"kind":@"工科",@"manager":@"交通部",@"province":@"辽宁",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_大连海事大学"},
  @{@"name":@"吉林大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"吉林",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_吉林大学"},
  @{@"name":@"延边大学",@"kind":@"综合",@"manager":@"吉林省",@"province":@"吉林",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_延边大学"},
  @{@"name":@"东北师范大学",@"kind":@"师范",@"manager":@"教育部",@"province":@"吉林",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_东北师范大学"},
  @{@"name":@"哈尔滨工业大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"黑龙江",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_哈尔滨工业大学"},
  @{@"name":@"哈尔滨工程大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"黑龙江",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_哈尔滨工程大学"},
  @{@"name":@"东北农业大学",@"kind":@"农业",@"manager":@"黑龙江省",@"province":@"黑龙江",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_东北农业大学"},
  @{@"name":@"东北林业大学",@"kind":@"林业",@"manager":@"教育部",@"province":@"黑龙江",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_东北林业大学"},
  @{@"name":@"复旦大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_复旦大学"},
  @{@"name":@"同济大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_同济大学"},
  @{@"name":@"上海交通大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_上海交通大学"},
  @{@"name":@"华东理工大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_华东理工大学"},
  @{@"name":@"东华大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_东华大学"},
  @{@"name":@"华东师范大学",@"kind":@"师范",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_华东师范大学"},
  @{@"name":@"上海外国语大学",@"kind":@"语言",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_上海外国语大学"},
  @{@"name":@"上海财经大学",@"kind":@"财经",@"manager":@"教育部",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_上海财经大学"},
  @{@"name":@"上海大学",@"kind":@"综合",@"manager":@"上海市",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_上海大学"},
  @{@"name":@"第二军医大学",@"kind":@"军事",@"manager":@"解放军总政治部",@"province":@"上海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_第二军医大学"},
  @{@"name":@"南京大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_南京大学"},
  @{@"name":@"苏州大学",@"kind":@"综合",@"manager":@"江苏省",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_苏州大学"},
  @{@"name":@"东南大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_东南大学"},
  @{@"name":@"南京航空航天大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_南京航空航天大学"},
  @{@"name":@"南京理工大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_南京理工大学"},
  @{@"name":@"中国矿业大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国矿业大学"},
  @{@"name":@"河海大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_河海大学"},
  @{@"name":@"江南大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_江南大学"},
  @{@"name":@"南京农业大学",@"kind":@"农业",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_南京农业大学"},
  @{@"name":@"中国药科大学",@"kind":@"医药",@"manager":@"教育部",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国药科大学"},
  @{@"name":@"南京师范大学",@"kind":@"师范",@"manager":@"江苏省",@"province":@"江苏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_南京师范大学"},
  @{@"name":@"浙江大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"浙江",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_浙江大学"},
  @{@"name":@"安徽大学",@"kind":@"综合",@"manager":@"安徽省",@"province":@"安徽",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_安徽大学"},
  @{@"name":@"中国科学技术大学",@"kind":@"工科",@"manager":@"中国科学院",@"province":@"安徽",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中国科学技术大学"},
  @{@"name":@"合肥工业大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"安徽",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_合肥工业大学"},
  @{@"name":@"厦门大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"福建",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_厦门大学"},
  @{@"name":@"福州大学",@"kind":@"工科",@"manager":@"福建省",@"province":@"福建",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_福州大学"},
  @{@"name":@"南昌大学",@"kind":@"综合",@"manager":@"江西省",@"province":@"江西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_南昌大学"},
  @{@"name":@"山东大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"山东",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_山东大学"},
  @{@"name":@"中国海洋大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"山东",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中国海洋大学"},
  @{@"name":@"郑州大学",@"kind":@"综合",@"manager":@"河南省",@"province":@"河南",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_郑州大学"},
  @{@"name":@"武汉大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_武汉大学"},
  @{@"name":@"华中科技大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_华中科技大学"},
  @{@"name":@"武汉理工大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_武汉理工大学"},
  @{@"name":@"华中农业大学",@"kind":@"农业",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_华中农业大学"},
  @{@"name":@"华中师范大学",@"kind":@"师范",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_华中师范大学"},
  @{@"name":@"中南财经政法大学",@"kind":@"财经",@"manager":@"教育部",@"province":@"湖北",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中南财经政法大学"},
  @{@"name":@"湖南大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"湖南",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_湖南大学"},
  @{@"name":@"中南大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"湖南",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中南大学"},
  @{@"name":@"湖南师范大学",@"kind":@"师范",@"manager":@"湖南省",@"province":@"湖南",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_湖南师范大学"},
  @{@"name":@"国防科学技术大学",@"kind":@"军事",@"manager":@"中央军委",@"province":@"湖南",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_国防科学技术大学"},
  @{@"name":@"中山大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"广东",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_中山大学"},
  @{@"name":@"暨南大学",@"kind":@"综合",@"manager":@"国务院侨务办公室",@"province":@"广东",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_暨南大学"},
  @{@"name":@"华南理工大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"广东",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_华南理工大学"},
  @{@"name":@"华南师范大学",@"kind":@"师范",@"manager":@"广东省",@"province":@"广东",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_华南师范大学"},
  @{@"name":@"海南大学",@"kind":@"综合",@"manager":@"海南省",@"province":@"海南",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_海南大学"},
  @{@"name":@"广西大学",@"kind":@"综合",@"manager":@"广西壮族自治区",@"province":@"广西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_广西大学"},
  @{@"name":@"四川大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"四川",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_四川大学"},
  @{@"name":@"西南交通大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"四川",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西南交通大学"},
  @{@"name":@"电子科技大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"四川",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_电子科技大学"},
  @{@"name":@"四川农业大学",@"kind":@"农业",@"manager":@"四川省",@"province":@"四川",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_四川农业大学"},
  @{@"name":@"西南财经大学",@"kind":@"财经",@"manager":@"教育部",@"province":@"四川",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西南财经大学"},
  @{@"name":@"西南大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"重庆",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西南大学"},
  @{@"name":@"重庆大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"重庆",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_重庆大学"},
  @{@"name":@"贵州大学",@"kind":@"综合",@"manager":@"贵州省",@"province":@"贵州",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_贵州大学"},
  @{@"name":@"云南大学",@"kind":@"综合",@"manager":@"云南省",@"province":@"云南",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_云南大学"},
  @{@"name":@"西藏大学",@"kind":@"综合",@"manager":@"西藏自治区",@"province":@"西藏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西藏大学"},
  @{@"name":@"西北大学",@"kind":@"综合",@"manager":@"陕西省",@"province":@"陕西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西北大学"},
  @{@"name":@"西安交通大学",@"kind":@"理工",@"manager":@"教育部",@"province":@"陕西",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_西安交通大学"},
  @{@"name":@"西北工业大学",@"kind":@"工科",@"manager":@"工业和信息化部",@"province":@"陕西",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_西北工业大学"},
  @{@"name":@"西安电子科技大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"陕西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_西安电子科技大学"},
  @{@"name":@"长安大学",@"kind":@"工科",@"manager":@"教育部",@"province":@"陕西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_长安大学"},
  @{@"name":@"西北农林科技大学",@"kind":@"农业",@"manager":@"教育部",@"province":@"陕西",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_西北农林科技大学"},
  @{@"name":@"陕西师范大学",@"kind":@"师范",@"manager":@"教育部",@"province":@"陕西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_陕西师范大学"},
  @{@"name":@"第四军医大学",@"kind":@"军事",@"manager":@"解放军总政治部",@"province":@"陕西",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_第四军医大学"},
  @{@"name":@"兰州大学",@"kind":@"综合",@"manager":@"教育部",@"province":@"甘肃",@"is211":@"1",@"is985":@"1",@"badgeimage":@"badge_兰州大学"},
  @{@"name":@"青海大学",@"kind":@"综合",@"manager":@"青海省",@"province":@"青海",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_青海大学"},
  @{@"name":@"宁夏大学",@"kind":@"综合",@"manager":@"宁夏回族自治区",@"province":@"宁夏",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_宁夏大学"},
  @{@"name":@"新疆大学",@"kind":@"综合",@"manager":@"新疆维吾尔自治区",@"province":@"新疆",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_新疆大学"},
  @{@"name":@"石河子大学",@"kind":@"综合",@"manager":@"新疆生产建设兵团",@"province":@"新疆",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_石河子大学"},
  @{@"name":@"中国石油大学",@"kind":@"理工",@"manager":@"教育部",@"province":@"山东、北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国石油大学"},
  @{@"name":@"中国地质大学",@"kind":@"理工",@"manager":@"教育部",@"province":@"湖北、北京",@"is211":@"1",@"is985":@"0",@"badgeimage":@"badge_中国地质大学"}];
    
//    for (NSDictionary *dict in arr) {
//        NSString *icon = dict[@"icon"];
//        // 新建网络图片的URL路径
//        NSURL *url = [NSURL URLWithString:icon];
//        // 下载图片的二进制数据
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        // 截取文件名
//        NSString *filename = [icon lastPathComponent];
//        // 文件路径
//        NSString *iconPath = [NSString stringWithFormat:@"/Users/ysj/Desktop/apps/TestGetData/TestGetData/Icons/%@", filename];
//        [data writeToFile:iconPath atomically:YES];
//    }
    
    NSMutableArray *newApps = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        newDict[@"name"] = dict[@"name"];
        newDict[@"kind"] = dict[@"kind"];
        newDict[@"manager"] = dict[@"manager"];
        newDict[@"province"] = dict[@"province"];
        newDict[@"is211"] = dict[@"is211"];
        newDict[@"is985"] = dict[@"is985"];
        newDict[@"badgeimage"] = dict[@"badgeimage"];
        [newApps addObject:newDict];
    }
    
    [newApps writeToFile:@"/Users/ysj/Desktop/apps/TestGetData/TestGetData/university.plist" atomically:YES];
}

@end
