//
//  PickerViewSelectDate.h
//  CustomerPickerViewDemo
//
//  Created by 宋宏康 on 2017/6/8.
//  Copyright © 2017年 中施科技. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PickerViewSelectDateDelegate <NSObject>

- (void)pickerSelectHour:(NSString *)hour min:(NSString *)min second:(NSString *)second;

@end

@interface PickerViewSelectDate : UIView

/**
  选中的label
 */
@property (nonatomic,strong)UILabel *selectLb;

/**
 代理
 */
@property (nonatomic,assign)id<PickerViewSelectDateDelegate>delegate;
/**
 显示当前的PickerViewSelectDate
 */
- (void)showPickerViewSelectDate;

/**
 设置pickveiw选中的第几行第几列

 @param row 行
 @param com 列
 */
- (void)selectRow:(int)row compont:(int)com;

@end
