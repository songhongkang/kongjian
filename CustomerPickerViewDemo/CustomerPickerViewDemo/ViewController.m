//
//  ViewController.m
//  CustomerPickerViewDemo
//
//  Created by 宋宏康 on 2017/6/8.
//  Copyright © 2017年 中施科技. All rights reserved.
//

#import "ViewController.h"
#import "PickerViewSelectDate.h"


@interface ViewController ()<PickerViewSelectDateDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(UIButton *)sender
{
    PickerViewSelectDate *picker = [[PickerViewSelectDate alloc]initWithFrame:self.view.bounds];
    picker.delegate = self;
    picker.selectLb.text = @"时间设置";
    [picker selectRow:5 compont:0];
    [picker selectRow:2 compont:1];
    [picker selectRow:10 compont:2];
    [picker showPickerViewSelectDate];
}

- (void)pickerSelectHour:(NSString *)hour min:(NSString *)min second:(NSString *)second
{
    NSLog(@"%@\n%@\n%@\n",hour,min,second);
}




@end
