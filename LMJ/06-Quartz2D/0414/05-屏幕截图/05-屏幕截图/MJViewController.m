//
//  MJViewController.m
//  05-屏幕截图
//
//  Created by apple on 14-4-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "UIImage+MJ.h"

@interface MJViewController ()
- (IBAction)clip;
@property (weak, nonatomic) IBOutlet UIView *whiteView;

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

- (IBAction)clip {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 1.捕捉
        UIImage *newImage = [UIImage captureWithView:self.view];
        
        // 2.写文件
        NSData *data = UIImagePNGRepresentation(newImage);
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
        [data writeToFile:path atomically:YES];
    });
}
@end
