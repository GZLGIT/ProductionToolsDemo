//
//  ViewController.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/19.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePicker.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *timeBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    timeBtn.frame = CGRectMake(10, TableViewFrameY, 100, 30);
    [timeBtn setTitle:@"请选择时间" forState:(UIControlStateNormal)];
     [self.view addSubview:timeBtn];
     @weakify(self);
     [[timeBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
         @strongify(self);
        CustomDatePicker *pickerView = [[CustomDatePicker alloc] initWithFrame:(CGRectMake(0, 500, Size_width, 200)) withType:(PickerViewTypeYear)];
         [KEYWINDOW addSubview:pickerView];
     }];
}


@end
