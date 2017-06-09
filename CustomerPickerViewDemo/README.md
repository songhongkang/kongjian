# 如何使用CustomerPickerViewDemo

![图片](https://dn-coding-net-production-pp.qbox.me/f6bc750d-a86b-4036-9d86-b7e28f427dcb.gif) 

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
