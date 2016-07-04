//
//  MJViewController.m
//  02-模仿UIImageView
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJImageView.h"

@interface MJViewController ()
- (IBAction)click;
@property (nonatomic, weak) MJImageView *imageView;
@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MJImageView *imageView = [[MJImageView alloc] init];
    
//    [imageView drawMyImage]; 
    
    
//    imageView.image = [UIImage imageNamed:@"me"];
//    imageView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

- (void)imageViewUse
{
    UIImage *image = [UIImage imageNamed:@"me"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    //    imageView.image = image;
    //    imageView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:imageView];
}

- (IBAction)click {
    self.imageView.image = [UIImage imageNamed:@"scene"];
}
@end
