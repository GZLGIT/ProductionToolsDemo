//
//  CustomDatePicker.h
//  PublicLetter
//
// 18/12/20.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PickerViewType) {
    PickerViewTypeDefault,//默认年月日 时分秒
    PickerViewTypeYear,//年月日
    PickerViewTypeTime,//时分秒
    
};

@protocol ChoseDataPickerViewDelegate <NSObject>

@optional
- (void)choseDataConfirmFinishWith:(NSString*)dataStr;

@end

@interface CustomDatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic)int year;
@property(nonatomic)int month;
@property(nonatomic)int day;
@property(nonatomic)int hours;
@property(nonatomic)int mintues;
@property (nonatomic)int seconds;


- (instancetype)initWithFrame:(CGRect)frame withType:(PickerViewType)type;

@property (nonatomic, weak) id <ChoseDataPickerViewDelegate>delegate;


@property(nonatomic,copy) void (^timeChoseBlock)(NSString *timeDayStr);


@end
