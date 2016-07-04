//
//  CellFrame.m
//  microblog
//
//  Created by ysj on 15/6/17.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "CellFrame.h"
#import "StatusData.h"

#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:14]

@implementation CellFrame

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize )maxSize{
    NSDictionary *attr = @{NSFontAttributeName:font};
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

- (void) setStatusData:(StatusData *)statusData{
    _statusData = statusData;
    CGFloat dist = 10;
    
    CGFloat iconX = dist;
    CGFloat iconY = dist;
    CGFloat iconH = 30;
    CGFloat iconW = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGSize nameSize = [self sizeWithText:self.statusData.name font:NameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameX = CGRectGetMaxX(_iconF) + dist;
    CGFloat nameY = iconY + (iconH - nameSize.height) * 0.5;
    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGFloat vipX = CGRectGetMaxX(_nameF) + dist;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconF) + dist;
    CGSize textSize  = [self sizeWithText:self.statusData.text font:TextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    _textF = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    if(self.statusData.picture){
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(_textF) + dist;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        _cellHeight = CGRectGetMaxY(_pictureF) + dist;
    }else{
        _cellHeight = CGRectGetMaxY(_textF) + dist;
    }
}





@end
