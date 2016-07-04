//
//  ViewController.m
//  TestPicker
//
//  Created by ysj on 15/6/27.
//  Copyright (c) 2015年 ysj. All rights reserved.
//

#import "ViewController.h"
#import "Flag.h"
#import "FlagView.h"
#import "Province.h"
#import "ProvinceView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *flags;
@property (nonatomic, strong) NSArray *provinces;
@property (nonatomic, strong) UIPickerView *flagsPicker;
@property (nonatomic, strong) UIPickerView *provincePicker;
@property (nonatomic, strong) Province *selectedProvince;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPicker];
    self.selectedProvince = self.provinces[0];
}


- (void)initPicker{
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    
    self.flagsPicker = picker;
    self.flagsPicker.dataSource = self;
    self.flagsPicker.delegate = self;
    [self.view addSubview:self.flagsPicker];
    
    UIPickerView *ppicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 260, self.view.frame.size.width, 100)];
    self.provincePicker = ppicker;
    self.provincePicker.dataSource = self;
    self.provincePicker.delegate = self;
    [self.view addSubview:self.provincePicker];
}

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    NSTextAttachment *xx = [[NSTextAttachment alloc]initWithData:[NSData data] ofType:@"x"];
//    return [NSAttributedString attributedStringWithAttachment:xx];
//}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return @"xx";
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (pickerView == self.flagsPicker) {
        FlagView *fv = [FlagView flagViewWithCirculateView:view];
        fv.flagViewData = self.flags[row];
        return fv;
    }else{
        ProvinceView *pv = [ProvinceView provinceViewWithCirculateView:view];
        if (component == 0) {
            pv.name = [self.provinces[row] name];
            return pv;
        }else{
            pv.name = self.selectedProvince.cities[row];
            return pv;
        }
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.provincePicker && component == 0) {
        self.selectedProvince = self.provinces[row];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    if (pickerView == self.flagsPicker) {
        return [FlagView viewHeight];
    }else{
        return 30;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (pickerView == self.flagsPicker) {
        return 1;
    }else{
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == self.flagsPicker) {
        return self.flags.count;
    }else{
        if(component == 0){
            return self.provinces.count;
        }else{
            return 10;
        }
    }
}

- (NSArray *)flags{
    if (_flags == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:@""];
        NSArray *arr  = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *flags = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            Flag *flag = [Flag flagWithDict:dict];
            [flags addObject:flag];
        }
        _flags = flags;
    }
    return _flags;
}

- (NSArray *)provinces{
    if(_provinces == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cities" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *provinces = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            Province *province = [Province provinceWithDict:dict];
            [provinces addObject:province];
        }
        _provinces = provinces;
    }
    return _provinces;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
