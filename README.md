# 如何使用CustomerPickerViewDemo

![图片](https://github.com/songhongkang/kongjian/blob/master/%E6%B5%8B%E8%AF%95.gif) 

# 如何使用导入头文件
#import "PickerViewSelectDate.h"

PickerViewSelectDate *picker = [[PickerViewSelectDate alloc]initWithFrame:self.view.bounds];
picker.delegate = self;
picker.selectLb.text = @"时间设置";
[picker selectRow:5 compont:0];
[picker selectRow:2 compont:1];
[picker selectRow:10 compont:2];
[picker showPickerViewSelectDate];

# ### 	  *实现代理方法*
- (void)pickerSelectHour:(NSString *)hour min:(NSString *)min second:(NSString *)second
{
NSLog(@"%@\n%@\n%@\n",hour,min,second);
}
