//
//  MJViewController.m
//  01-涂鸦
//
//  Created by apple on 14-4-20.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJPaintView.h"
#import "UIImage+MJ.h"
#import "MBProgressHUD+MJ.h"

@interface MJViewController ()
- (IBAction)clear;
- (IBAction)back;
- (IBAction)save;
@property (weak, nonatomic) IBOutlet MJPaintView *paintView;

@end

@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clear {
    [self.paintView clear];
}

- (IBAction)back {
    [self.paintView back];
}

- (IBAction)save {
    // 1.截图
    UIImage *image = [UIImage captureWithView:self.paintView];
    
    // 2.保存到图片
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

/**
 保存图片操作之后就会调用
 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) { // 保存失败
        [MBProgressHUD showError:@"保存失败"];
    } else { // 保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}
@end
