//
//  MJProduct.h
//  00-ItcastLottery
//
//  Created by apple on 14-4-17.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

/**
 *  
 "title": "网易电影票",
 "icon": "movie@2x.png",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "customUrl": "movieticket163"
 */

#import <Foundation/Foundation.h>

@interface MJProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
