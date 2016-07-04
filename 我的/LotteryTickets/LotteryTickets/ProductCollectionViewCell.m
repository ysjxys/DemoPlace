//
//  ProductCollectionViewCell.m
//  LotteryTickets
//
//  Created by ysj on 15/7/22.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ProductCollectionViewCell.h"
#import "Product.h"

@interface ProductCollectionViewCell()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end
@implementation ProductCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat imageX = 13;
        CGFloat imageY = 0;
        CGFloat imageW = 55;
        CGFloat imageH = 55;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        imageView.layer.cornerRadius = 8;
        imageView.clipsToBounds = YES;
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 56, 80, 24)];
        [label setFont:[UIFont systemFontOfSize:12]];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        self.label = label;
    }
    return self;
}


- (void)setProduct:(Product *)product{
    _product = product;
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.label.text = product.title;
}


@end
