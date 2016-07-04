//
//  ProductViewController.m
//  LotteryTickets
//
//  Created by ysj on 15/7/22.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ProductViewController.h"
#import "Product.h"
#import "ProductCollectionViewCell.h"

#define cellID @"productID"

@interface ProductViewController()
@property (nonatomic, strong) NSArray *products;
@end

@implementation ProductViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:cellID];
}

- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:layout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.product = self.products[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Product *p = self.products[indexPath.item];
    NSURL *customUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",p.customUrl,p.identifier]];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:customUrl]) {
        [app openURL:customUrl];
    }else{
        [app openURL:[NSURL URLWithString:p.url]];
    }
}

- (NSArray *)products{
    if (!_products) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:@""];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in jsonData) {
            Product *product = [Product productWithDict:dict];
            [tempArr addObject:product];
        }
        _products = tempArr;
    }
    return _products;
}

@end
