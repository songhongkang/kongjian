# 如何使用_HKAlertView
![图片](https://github.com/songhongkang/songhk_CustomerAlertView/blob/master/%E5%9B%BE%E7%89%87.gif) 
# 如何使用导入头文件
**** #import "HKAlertView.h"

HKAlertView *hkalertView = [[HKAlertView alloc] initWithTitle:@"您 确定退出登录吗?" withPlaceHoldTextField:nil sureBtn:@"确定" cancleBtn:@"取消" withController:self IsHaveTextFiled:NO withFinalyProperty:nil];
hkalertView.delegate = self;
hkalertView.tag = 200;
[hkalertView showHKAlertView];

# ### 	  *实现代理方法*
/**
点击确定按钮的回调

@param alertView 当前自定义alertview
@param inputStr 输入的字符串
*/
- (void)clickAlertViewSureBtn:(UIView *)alertView withInputString:(NSString *)inputStr
{
NSLog(@"inputStr===============%@",inputStr);
}
