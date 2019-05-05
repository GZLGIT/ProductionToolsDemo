
//
//  CustomDatePicker.m
//  PublicLetter
//
//18/12/20.
//

#import "CustomDatePicker.h"

#define KtitleLab_Tag 7175

@implementation CustomDatePicker
{
    
    NSArray *dayarr1;
    NSArray *dayarr2;
    NSMutableArray *yeararr;
    NSMutableArray *hoursArray;
    NSMutableArray *minutesArray;
    NSMutableArray *secondsArray;
    UIPickerView *picker;
    NSInteger typeChose;
}
@synthesize year,day,month,hours,mintues,seconds;


-(instancetype)initWithFrame:(CGRect)frame withType:(PickerViewType)type {
    
    CGRect superFrame = CGRectMake(0, 0, Size_width, Size_height);
    
    self = [super initWithFrame:superFrame];
    if (self) {
        
        
        // 背景色
        UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        backBtn.frame = CGRectMake(0, 0, Size_width, Size_height);
        [backBtn addTarget:self action:@selector(dissBtnmissAction:) forControlEvents:(UIControlEventTouchUpInside)];
        backBtn.backgroundColor = [[UIColor darkTextColor] colorWithAlphaComponent:0.3];
        [self addSubview:backBtn];

        // 处理数据
        typeChose = type;
        [self handelTimeArray];
        
        // 顶部按钮 取消 确定
        [self loadSubTopViewWith:frame];
        
        picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(frame)+40, CGRectGetWidth(frame), CGRectGetHeight(frame)-40)];
        picker.backgroundColor = [UIColor whiteColor];
        picker.delegate  = self;
        picker.dataSource = self;
        picker.showsSelectionIndicator = YES;
        [self addSubview:picker];
        
       
        switch (type) {
            case PickerViewTypeDefault:
            {
                //            [self loadSubLine2ViewWith:frame];时分秒标题没用到
                [picker selectRow:0 inComponent:0 animated:YES];
                [picker selectRow:month-1 inComponent:1 animated:YES];
                [picker selectRow:day-1 inComponent:2 animated:YES];
                
                [picker selectRow:hours inComponent:3 animated:YES];
                
                [picker selectRow:mintues inComponent:4 animated:YES];
                
                [picker selectRow:seconds inComponent:5 animated:YES];
            }
                break;
            case PickerViewTypeYear:
            {
                
                //            [self loadSubLine1ViewWith:frame]; 年月日标题没用到
                [picker selectRow:0 inComponent:0 animated:YES];
                [picker selectRow:month-1 inComponent:1 animated:YES];
                [picker selectRow:day-1 inComponent:2 animated:YES];
            }
                break;
            case PickerViewTypeTime:
                {
                   
                    [picker selectRow:hours inComponent:0 animated:YES];
                   
                    [picker selectRow:mintues inComponent:1 animated:YES];
                    
                    [picker selectRow:seconds inComponent:2 animated:YES];
                }
                break;
            default:
                break;
        }
        
        
        
        
        
    }
    return self;
}

#pragma mark--初始化时间数组
- (void)handelTimeArray {
    
    dayarr1 = [NSArray arrayWithObjects:@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
    dayarr2 = [NSArray arrayWithObjects:@"31",@"29",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31", nil];
    yeararr = [[NSMutableArray alloc] initWithCapacity:0];
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    year = [[formatter stringFromDate:date] intValue];
    [formatter setDateFormat:@"MM"];
    month = [[formatter stringFromDate:date] intValue];
    [formatter setDateFormat:@"dd"];
    day = [[formatter stringFromDate:date] intValue];
    
    for (int i = year; i<year+30; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [yeararr addObject:str];
    }
    
    hoursArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<24; i++) {
        if (i<10) {
            [hoursArray addObject:[NSString stringWithFormat:@"0%d", i]];
        }else {
            [hoursArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    minutesArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<60; i++) {
        if (i<10) {
            [minutesArray addObject:[NSString stringWithFormat:@"0%d", i]];
        }else {
            [minutesArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    secondsArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i<60; i++) {
        if (i<10) {
            [secondsArray addObject:[NSString stringWithFormat:@"0%d", i]];
        }else {
            [secondsArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    [formatter setDateFormat:@"HH"];
    hours = [[formatter stringFromDate:date] intValue];
    
    [formatter setDateFormat:@"mm"];
    mintues = [[formatter stringFromDate:date] intValue];
    
    [formatter setDateFormat:@"ss"];
    seconds = [[formatter stringFromDate:date] intValue];
    
}

#pragma mark--顶部按钮 取消 时间显示 确定
- (void)loadSubTopViewWith:(CGRect)frame {
    
    UIView *topView = [[UIView alloc] initWithFrame:(CGRectMake(0, CGRectGetMinY(frame), Size_width, 40))];
    topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topView];
    
    UIButton *closeBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    closeBtn.frame = CGRectMake(0, 0, 60, 40);
    [closeBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    [closeBtn setTitleColor:RGBA(234, 98, 98, 1) forState:(UIControlStateNormal)];
    closeBtn.tag = 309;
    [closeBtn addTarget:self action:@selector(dissBtnmissAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [topView addSubview:closeBtn];
    
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.text = @"请选择时间";
    titleLab.tag = KtitleLab_Tag;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 40));
        make.top.mas_equalTo(0);
        make.centerX.equalTo(topView);
    }];

    UIButton *timeBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [timeBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    timeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [timeBtn setTitleColor:RGBA(234, 98, 98, 1) forState:(UIControlStateNormal)];
    timeBtn.tag = 310;
    [timeBtn addTarget:self action:@selector(dissBtnmissAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [topView addSubview:timeBtn];
    [timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 40));
        make.right.and.top.mas_equalTo(0);
    }];
    
    UILabel *lineLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, CGRectGetMaxY(closeBtn.frame)-1, CGRectGetWidth(frame), 1))];
    lineLab.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    [topView addSubview:lineLab];
    
    [self handelTimeStringShow];
    
    
}

- (void)loadSubLine1ViewWith:(CGRect)frame {
    // 日期线条
    UILabel *yearLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 8, CGRectGetWidth(frame)/3, 20))];
    yearLab.text = @"年";
    yearLab.font = [UIFont systemFontOfSize:12];
    yearLab.textAlignment = NSTextAlignmentCenter;
    yearLab.textColor = RGBA(129, 129, 129, 1);
    [self addSubview:yearLab];
    
    UILabel *monthLab = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/3, 8, CGRectGetWidth(frame)/3, 20))];
    monthLab.text = @"月";
    monthLab.font = [UIFont systemFontOfSize:12];
    monthLab.textAlignment = NSTextAlignmentCenter;
    monthLab.textColor = RGBA(129, 129, 129, 1);
    [self addSubview:monthLab];
    
    UILabel *dayLab = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/3*2, 8, CGRectGetWidth(frame)/3, 20))];
    dayLab.text = @"日";
    dayLab.font = [UIFont systemFontOfSize:12];
    dayLab.textAlignment = NSTextAlignmentCenter;
    dayLab.textColor = RGBA(129, 129, 129, 1);
    [self addSubview:dayLab];
    
    // 竖线
    UILabel *leftLine = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/3, 34, 1, CGRectGetHeight(frame)-60))];
    leftLine.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:leftLine];
    
    UILabel *rightLine = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/3*2, 34, 1, CGRectGetHeight(frame)-60))];
    rightLine.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:rightLine];
    
}

- (void)loadSubLine2ViewWith:(CGRect)frame {
    // 时间线条
    UILabel *yearLab = [[UILabel alloc] initWithFrame:(CGRectMake(0, 8, CGRectGetWidth(frame)/2, 20))];
    yearLab.text = @"时";
    yearLab.font = [UIFont systemFontOfSize:12];
    yearLab.textAlignment = NSTextAlignmentCenter;
    yearLab.textColor = RGBA(129, 129, 129, 1);
    [self addSubview:yearLab];
    
    UILabel *monthLab = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/2, 8, CGRectGetWidth(frame)/2, 20))];
    monthLab.text = @"分";
    monthLab.font = [UIFont systemFontOfSize:12];
    monthLab.textAlignment = NSTextAlignmentCenter;
    monthLab.textColor = RGBA(129, 129, 129, 1);
    [self addSubview:monthLab];
    
    // 竖线
    UILabel *middleLine = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetWidth(frame)/2, 34, 1, CGRectGetHeight(frame)-60))];
    middleLine.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:middleLine];
}

#pragma mark - pickerview
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (typeChose == PickerViewTypeYear || typeChose == PickerViewTypeTime) {
        // 只有年月日
        return 3;
    }
    // 年月日时分秒
    return 6;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (typeChose == PickerViewTypeYear) {
        
        // 只有年月日
        if(component == 0)
        {
            return yeararr.count;
        }
        else if(component == 1){
            
            return 12;
        }
        else
        {
            //获得前二个滚轮的当前所选行的索引
            int row = (int)[picker selectedRowInComponent:0];
            int nowyear = [[yeararr objectAtIndex:row] intValue];
            int nowmonth = (int)[picker selectedRowInComponent:1];
            if ((nowyear % 4 == 0 && nowyear % 100 !=0 )||(nowyear % 400 == 0)) {
                return [[dayarr2 objectAtIndex:nowmonth] intValue];
            }
            else
            {
                return [[dayarr1 objectAtIndex:nowmonth] intValue];
            }
            
            
        }
    }else if (typeChose == PickerViewTypeDefault){
        // 年月日时分秒
        if(component == 0)
        {
            return yeararr.count;
        }
        else if(component == 1){
            
            return 12;
        }
        else if(component == 2) {
            //获得前二个滚轮的当前所选行的索引
            int row = (int)[picker selectedRowInComponent:0];
            int nowyear = [[yeararr objectAtIndex:row] intValue];
            int nowmonth = (int)[picker selectedRowInComponent:1];
            if ((nowyear % 4 == 0 && nowyear % 100 !=0 )||(nowyear % 400 == 0)) {
                return [[dayarr2 objectAtIndex:nowmonth] intValue];
            }
            else
            {
                return [[dayarr1 objectAtIndex:nowmonth] intValue];
            }
            
            
        }else if (component == 3) {
            return 24;
        }else {
            return 60;
        }
    }else {
        // 时分秒
        if (component==0) {
            return 24;
        }else {
            return 60;
        }
    }
    
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //    ((UIView *)[self.pickView.subviews objectAtIndex:1]).backgroundColor = [YSColor(255, 255, 255) colorWithAlphaComponent:0.5];
    
    //    ((UIView *)[self.pickView.subviews objectAtIndex:2]).backgroundColor = [YSColor(255, 255, 255) colorWithAlphaComponent:0.5];
//    [pickerView.subviews objectAtIndex:1].hidden = YES;
//    [pickerView.subviews objectAtIndex:2].hidden = YES;
    
    UILabel *mycom1 = [[UILabel alloc] init];
    mycom1.textAlignment = NSTextAlignmentCenter;
    mycom1.backgroundColor = [UIColor clearColor];
    if (typeChose != PickerViewTypeDefault) {
        mycom1.frame = CGRectMake(0, 0, self.frame.size.width/3.0, 30);
    }else {
        mycom1.frame = CGRectMake(0, 0, self.frame.size.width/6.0-10, 30);
    }
    [mycom1 setFont:[UIFont boldSystemFontOfSize:13]];
    if (typeChose == PickerViewTypeYear) {
        // 只有年月日
        
        if(component == 0)
        {
            mycom1.text = [NSString stringWithFormat:@"%@年",[yeararr objectAtIndex:row]];
        }
        else if(component == 1){
            mycom1.text = [NSString stringWithFormat:@"%ld月",row+1];
            
        }else
        {
            mycom1.text = [NSString stringWithFormat:@"%ld日",row+1];
        }
    }else if (typeChose == PickerViewTypeDefault){
        // 年月日时分秒
        if(component == 0)
        {
            mycom1.text = [NSString stringWithFormat:@"%@年",[yeararr objectAtIndex:row]];
        }
        else if(component == 1){
            mycom1.text = [NSString stringWithFormat:@"%ld月",row+1];
            
        }else if (component==2) {
            mycom1.text = [NSString stringWithFormat:@"%ld日",row+1];
        }else if (component == 3) {
            mycom1.text = [NSString stringWithFormat:@"%@时",[hoursArray objectAtIndex:row]];
        }else if (component == 4){
            mycom1.text = [NSString stringWithFormat:@"%@分",[minutesArray objectAtIndex:row]];
            
        }else {
            mycom1.text = [NSString stringWithFormat:@"%@秒",[secondsArray objectAtIndex:row]];
            
        }
    }else if (typeChose == PickerViewTypeTime) {
        // 时分秒
        switch (component) {
            case 0:
                {
                    mycom1.text = [NSString stringWithFormat:@"%@时",[hoursArray objectAtIndex:row]];
                }
                break;
            case 1:
                {
                    mycom1.text = [NSString stringWithFormat:@"%@分",[minutesArray objectAtIndex:row]];
                }
                break;
            case 2:
                {
                    mycom1.text = [NSString stringWithFormat:@"%@秒",[secondsArray objectAtIndex:row]];
                }
                break;
            default:
                break;
        }
        
    }
    return mycom1;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (typeChose == PickerViewTypeTime || typeChose == PickerViewTypeYear) {
        return self.frame.size.width/3.0;
    }else {
        return self.frame.size.width/6.0-10;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (typeChose == PickerViewTypeYear) {
        // 只有年月日
        if(component == 0||component == 1)
        {
            //当第一个滚轮发生变化时,刷新第二个滚轮的数据
            [picker reloadComponent:2];
            //让刷新后的第二个滚轮重新回到第一行
            [picker selectRow:0 inComponent:2 animated:YES];
        }
        int rowy = (int)[picker selectedRowInComponent:0];
        int rowm = (int)[picker selectedRowInComponent:1];
        int rowd = (int)[picker selectedRowInComponent:2];
        year = [[yeararr objectAtIndex:rowy] intValue];
        month = (int)rowm+1;
        day = (int)rowd+1;
    }else if (typeChose == PickerViewTypeDefault){
        // 年月日 时分秒
        if(component == 0||component == 1)
        {
            //当第一个滚轮发生变化时,刷新第二个滚轮的数据
            [picker reloadComponent:2];
            //让刷新后的第二个滚轮重新回到第一行
            [picker selectRow:0 inComponent:2 animated:YES];
        }
        int rowy = (int)[picker selectedRowInComponent:0];
        int rowm = (int)[picker selectedRowInComponent:1];
        int rowd = (int)[picker selectedRowInComponent:2];
        year = [[yeararr objectAtIndex:rowy] intValue];
        month = (int)rowm+1;
        day = (int)rowd+1;

        if (component == 3) {
            hours = [[hoursArray objectAtIndex:row] intValue];
        }else if (component == 4){
            mintues = [[minutesArray objectAtIndex:row] intValue];
        }else if (component == 5) {
            seconds = [[secondsArray objectAtIndex:row] intValue];
        }
    }else if (typeChose == PickerViewTypeTime) {
        switch (component) {
            case 0:
            {
                hours = [[hoursArray objectAtIndex:row] intValue];
            }
                break;
            case 1:
            {
                mintues = [[minutesArray objectAtIndex:row] intValue];
            }
                break;
            case 2:
                {
                    seconds = [[secondsArray objectAtIndex:row] intValue];
                }
                break;
            default:
                break;
        }
    }
   
    [self handelTimeStringShow];
}


- (void)handelTimeStringShow {
    
    NSString *monthStr;
    NSString *dayStr;
    if (month < 10) {
        monthStr = [NSString stringWithFormat:@"0%d", month];
    }else {
        monthStr = [NSString stringWithFormat:@"%d", month];
    }
    if (day < 10) {
        dayStr = [NSString stringWithFormat:@"0%d", day];
    }else {
        dayStr = [NSString stringWithFormat:@"%d", day];
    }
    NSString *hourStr;
    NSString *minutesStr;
    NSString *secondSgtr;
    if (hours < 10) {
        hourStr = [NSString stringWithFormat:@"0%d", hours];
    }else {
        hourStr = [NSString stringWithFormat:@"%d", hours];
    }
    if (mintues < 10) {
        minutesStr = [NSString stringWithFormat:@"0%d", mintues];
    }else {
        minutesStr = [NSString stringWithFormat:@"%d", mintues];
    }
    if (seconds < 10) {
        secondSgtr = [NSString stringWithFormat:@"0%d", seconds];
    }else {
        secondSgtr = [NSString stringWithFormat:@"%d", seconds];
    }
    // 标题的显示
    UILabel *titleLab = [self viewWithTag:KtitleLab_Tag];
    switch (typeChose) {
        case PickerViewTypeDefault:
        {
            
            titleLab.text = [NSString stringWithFormat:@"%d-%@-%@ %@:%@:%@", year, monthStr, dayStr, hourStr, minutesStr, secondSgtr];
        }
            break;
        case PickerViewTypeYear:
        {
            titleLab.text = [NSString stringWithFormat:@"%d-%@-%@", year, monthStr, dayStr];
        }
            break;
        case PickerViewTypeTime:
        {
            titleLab.text = [NSString stringWithFormat:@"%@:%@:%@", hourStr, minutesStr, secondSgtr];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark--点击按钮事件
- (void)dissBtnmissAction:(UIButton*)sender {
    
    [self removeFromSuperview];
    if (sender.tag == 310) {
        // 时间是 16:8:9 不带0 不是双位
//        NSString *timeStr = [NSString stringWithFormat:@"%d-%d-%d %d:%d:%d", year, month, day, hours, mintues, seconds];
        UILabel *titleLab = [self viewWithTag:KtitleLab_Tag];
        NSString *timeStr = titleLab.text;
        NSLog(@"选中的时间是:%@", timeStr);
        if ([self.delegate respondsToSelector:@selector(choseDataConfirmFinishWith:)]) {
            [self.delegate choseDataConfirmFinishWith:timeStr];
        }else if (self.timeChoseBlock) {
            self.timeChoseBlock(timeStr);
        }
        
    }
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
