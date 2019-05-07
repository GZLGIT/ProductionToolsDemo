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
#import "TextCollectionViewController.h"
#import "TextBrokenLineViewController.h"
#import "CSLateralSpreadsViewController.h"
#import "YSRightToLeftTransition.h"
#import "YSHRMTrainingChartView.h"
#import "YSHRMTrainingChartView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YSHRMTrainingChartView *lineChatView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = @[@"请选择时间", @"圆滑的折线段", @"collectionView"].mutableCopy;
    [self loadNewNavView];
    [self loadSubView];
    
}

- (void)loadNewNavView {
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"侧滑" forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"侧滑"] forState:UIControlStateNormal];
//    btn.imageView.contentMode = UIViewContentModeCenter;
    btn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:ScaleFont(15)];
    [btn addTarget:self action:@selector(clcikedSpreadsBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScaleW(48), ScaleH(38)));
        make.top.mas_equalTo(kStatusBarHeight+ScaleH(2));
        make.right.mas_equalTo(-10);
    }];
}
- (void)loadSubView {
    
    
    NSString *str = @"问哈都好得很华东师大,结婚啥时间德哈卡萨科技和贷款计划外挖好卡的很问哈都好得很华东师大,结婚啥时间德哈卡萨科技和贷款计";
    CGFloat height = [CheckOutTool calculateRowHeight:str fontSize:14 controlWidth:Size_width-40];
    NSLog(@"%.4f", height);
    
    
    [self.view addSubview:self.tableView];

    UIView *footerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, Size_width, 120))];
    footerView.backgroundColor = self.navView.backgroundColor;
    self.tableView.tableFooterView = footerView;
    

    UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(20, 0, Size_width-40, 100))];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.numberOfLines = 0;
    lab.backgroundColor = [UIColor whiteColor];
    [footerView addSubview:lab];
    NSMutableAttributedString *strNew = [CheckOutTool atttibutedStringForString:str LineSpace:4 ColumnSpace:6];
    lab.attributedText = strNew;
    
    /*
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

- (void)loadSubLineView {
    [self.view addSubview:self.coverBtn];
    _lineChatView = [[YSHRMTrainingChartView alloc] initWithFrame:CGRectMake(0, Size_height-300, Size_width, 230)];
    [self.view addSubview:_lineChatView];
    _lineChatView.dataArrOfY = @[@"100",@"65",@"35",@"0"];//Y轴坐标
    _lineChatView.dataArrOfX = @[@"第一季度",@"第二季度",@"第三季度",@"第四季度"];//X轴坐标
    _lineChatView.dataArrOfPoint = @[@"0",@"30",@"20",@"70"];
    
}

- (void)choseTimeCellAction {
    
    CustomDatePicker *pickerView = [[CustomDatePicker alloc] initWithFrame:(CGRectMake(0, 500, Size_width, 200)) withType:(PickerViewTypeDefault)];
    [KEYWINDOW addSubview:pickerView];
}

- (void)clcikedSpreadsBtn:(UIButton*)sender {
    
    
    CSLateralSpreadsViewController *deptVC = [CSLateralSpreadsViewController new];
    deptVC.view.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.4];
    //    deptVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    // 自定义的模态动画
    deptVC.modalPresentationStyle = UIModalPresentationCustom;
    deptVC.transitioningDelegate = [YSRightToLeftTransition sharedYSTransition];
    [self presentViewController:deptVC animated:YES completion:nil];
}

#pragma mark--tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
    if (!cell) {
        cell = [[CustomTextTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"imgCell"];
        
    }
    cell.titleLab.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            [self choseTimeCellAction];
        }
            break;
            case 1:
        {

            [self loadSubLineView];
        }
            break;
        case 2:
        {
            TextCollectionViewController *collectionVC = [TextCollectionViewController new];
            
            [self.navigationController pushViewController:collectionVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark--setter&&getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, kTopHeight, Size_width, Size_height-kBottomHeight)) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    }
    return _tableView;
}

@end
