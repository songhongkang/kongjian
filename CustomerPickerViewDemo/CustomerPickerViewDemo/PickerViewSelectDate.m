//
//  PickerViewSelectDate.m
//  CustomerPickerViewDemo
//
//  Created by 宋宏康 on 2017/6/8.
//  Copyright © 2017年 中施科技. All rights reserved.
//

#import "PickerViewSelectDate.h"
#import "UIView+Positioning.h"

//屏幕宽和高
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

//RGB
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 缩放比
#define hScale ([UIScreen mainScreen].bounds.size.height) / 667
//字体大小
#define kfont 15

@interface PickerViewSelectDate ()<UIPickerViewDelegate,UIPickerViewDataSource>
// 显示pickerView的VIEW
@property (nonatomic,strong)UIView *bgV;
// 取消按钮
@property (nonatomic,strong)UIButton *cancelBtn;
// 完成按钮
@property (nonatomic,strong)UIButton *conpleteBtn;
// pickerView
@property (nonatomic,strong)UIPickerView *pickerV;
// line
@property (nonatomic,strong)UIView *line;
// 数据源
@property (nonatomic,strong)NSMutableArray *array;
// 小时
@property (nonatomic,strong)NSMutableArray *hour;
// 分钟
@property (nonatomic,strong)NSMutableArray *minute;
// 秒
@property (nonatomic,strong)NSMutableArray *second;
//选中的时
@property (nonatomic,strong)NSString *hourSelectString;
//选中的分
@property (nonatomic,strong)NSString *minuteSelectString;
//选中的秒
@property (nonatomic,strong)NSString *secondSelectString;

@end

@implementation PickerViewSelectDate

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self initData];
        self.array = [NSMutableArray array];
        [self.array addObject:self.hour];
        [self.array addObject:self.minute];
        [self.array addObject:self.second];
        [self creatUIFrame:frame];
    }
    return self;
}

- (void)initData
{
    self.hourSelectString = @"00 小时";
    self.minuteSelectString = @"00 分";
    self.secondSelectString = @"00 秒";
}

- (void)showPickerViewSelectDate
{
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
}

- (void)selectRow:(int)row compont:(int)com
{
    if (com >= 3) return;
    if (com == 1 || com == 2)
    {
        [_pickerV selectRow:10 * 61 + row inComponent:com animated:YES];
    }else
    {
        [_pickerV selectRow:10 * 25 + row inComponent:com animated:YES];
    }
    
    if (com == 0) {
        _hourSelectString = [_hour objectAtIndex:row % 25];
    }
    if (com == 1) {
        _minuteSelectString = [_minute objectAtIndex:row % 61];
    }
    if (com == 2) {
        _secondSelectString = [_second objectAtIndex:row % 61];
    }
}

- (NSMutableArray *)hour
{
    if (!_hour)
    {
        _hour = [NSMutableArray array];
        for (int i = 0; i<= 24; i++)
        {
            [_hour addObject:[NSString stringWithFormat:@"%.2d  小时",i]];
        }
    }
    return _hour;
}

- (NSMutableArray *)minute
{
    if (!_minute)
    {
        _minute = [NSMutableArray array];
        for (int i = 0; i<= 60; i++)
        {
            [_minute addObject:[NSString stringWithFormat:@"%.2d  分",i]];
        }
    }
    return _minute;
}

- (NSMutableArray *)second
{
    if (!_second)
    {
        _second = [NSMutableArray array];
        for (int i = 0; i<= 60; i++)
        {
            [_second addObject:[NSString stringWithFormat:@"%.2d  秒",i]];
        }
    }
    return _second;
}

- (void)creatUIFrame:(CGRect)frame
{
    self.frame = frame;
    self.backgroundColor = RGBA(51, 51, 51, 0.8);
    
    self.bgV = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, kScreenWidth, 260*hScale)];
    self.bgV.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgV];
    
    
    [self showAnimation];
    
    //取消
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgV addSubview:self.cancelBtn];
    self.cancelBtn.frame = CGRectMake(15, 0, 40, 44);
    
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:kfont];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelBtn setTitleColor:RGBA(0, 122, 255, 1) forState:UIControlStateNormal];
    //完成
    self.conpleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bgV addSubview:self.conpleteBtn];
  
    self.conpleteBtn.frame = CGRectMake(kScreenWidth- 40 - 15, 0, 40, 44);

    self.conpleteBtn.titleLabel.font = [UIFont systemFontOfSize:kfont];
    [self.conpleteBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.conpleteBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.conpleteBtn setTitleColor:RGBA(0, 122, 255, 1) forState:UIControlStateNormal];
    
    //选择titi
    self.selectLb = [UILabel new];
    [self.bgV addSubview:self.selectLb];

    self.selectLb.frame = CGRectMake(self.cancelBtn.x + self.cancelBtn.width, 0, kScreenWidth - 2 * (self.cancelBtn.x +self.cancelBtn.width), 44);
    
    self.selectLb.font = [UIFont systemFontOfSize:kfont];
    self.selectLb.textAlignment = NSTextAlignmentCenter;
    
    //线
    UIView *line = [UIView new];
    self.line = line;
    [self.bgV addSubview:self.line];
    line.frame = CGRectMake(0,self.cancelBtn.bottom, kScreenWidth, 0.5);
    line.backgroundColor = RGBA(224, 224, 224, 1);
    //选择器
    self.pickerV = [[UIPickerView alloc] initWithFrame:CGRectMake(0,line.bottom, kScreenWidth, self.bgV.height - 44.5)];
    [self.bgV addSubview:self.pickerV];

    

    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    

}

//显示动画
- (void)showAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.bgV.frame;
        frame.origin.y = self.frame.size.height-260*hScale;
        self.bgV.frame = frame;
    }];
}

#pragma mark-----UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerVie
{
    return self.array.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray * arr = (NSArray *)[self.array objectAtIndex:component];
    return arr.count * 100;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label=[[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    for(UIView *single in pickerView.subviews)
    {
        if (single.frame.size.height < 1)
        {
            single.backgroundColor = [UIColor grayColor];
        }
    }
    return label;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
    return [arr objectAtIndex:row % arr.count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 110;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *arr = (NSArray *)[self.array objectAtIndex:component];
    if (component == 0) {
        _hourSelectString = [arr objectAtIndex:row % arr.count];
    }
    if (component == 1) {
        _minuteSelectString = [arr objectAtIndex:row % arr.count];
    }
    if (component == 2) {
        _secondSelectString = [arr objectAtIndex:row % arr.count];
    }
}



#pragma mark - 按钮点击事件

- (void)cancelBtnClick
{
    [self hideAnimation];
}

- (void)completeBtnClick
{
    if ([self.delegate respondsToSelector:@selector(pickerSelectHour:min:second:)])
    {
        [self.delegate pickerSelectHour:_hourSelectString min:_minuteSelectString second:_secondSelectString];
    }
    [self hideAnimation];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideAnimation];
}

//隐藏动画
- (void)hideAnimation{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect frame = self.bgV.frame;
        frame.origin.y = self.frame.size.height;
        self.bgV.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self.bgV removeFromSuperview];
        [self removeFromSuperview];
    }];
}



@end
