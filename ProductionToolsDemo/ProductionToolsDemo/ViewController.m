//
//  ViewController.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/19.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePicker.h"
#import "CustomTextTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
    
    
}


- (void)loadSubView {
    
    [self.view addSubview:self.tableView];
    /*
    UIButton *timeBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    timeBtn.frame = CGRectMake(10, TableViewFrameY+40, 100, 30);
    [timeBtn setTitle:@"请选择时间" forState:(UIControlStateNormal)];
    [self.view addSubview:timeBtn];
    @weakify(self);
    [[timeBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {

        CustomDatePicker *pickerView = [[CustomDatePicker alloc] initWithFrame:(CGRectMake(0, 500, Size_width, 200)) withType:(PickerViewTypeDefault)];
        [KEYWINDOW addSubview:pickerView];
    }];
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:timeBtn.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    // 描边宽度
    maskLayer.lineWidth = 1;
    
    // kCGLineCapButt 该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。不附加任何形状
    // kCGLineCapRound 该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆(在线段头尾添加半径为线段 lineWidth 一半的半圆)
    // kCGLineCapSquare 该属性值指定绘制方形端点。与butt相但比butt长点(在线段头尾添加半径为线段 lineWidth 一半的矩形)
    maskLayer.lineCap = kCALineCapSquare;
    // 带边框则两个颜色不要设置成一样即可
    // 描边颜色
    maskLayer.strokeColor = [UIColor redColor].CGColor;
    // 填充颜色 不需要背景色的话 需要设置成白色
    maskLayer.fillColor = [UIColor whiteColor].CGColor;
    
    maskLayer.path = maskPath.CGPath;
    
    [timeBtn.layer addSublayer:maskLayer];
*/
    
    
}

#pragma mark--tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
    if (!cell) {
        cell = [[CustomTextTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"imgCell"];
        
    }
    
    return cell;
}

#pragma mark--setter&&getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, TableViewFrameY, Size_width, Size_height-TableViewFrameY)) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        
    }
    return _tableView;
}

@end
