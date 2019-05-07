//
//  CSLateralSpreadsViewController.m
//  ProductionToolsDemo
//
//  Created by GZl on 2019/5/7.
//  Copyright © 2019 龙禧. All rights reserved.
//

#import "CSLateralSpreadsViewController.h"

@interface CSLateralSpreadsViewController ()
@property (nonatomic, strong) UIView *navView;

@end

@implementation CSLateralSpreadsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviView];
    
}

- (void)setNaviView {
    _navView = [[UIView alloc]initWithFrame:CGRectMake(ScaleW(75), 0, Size_width-ScaleW(75), kTopHeight)];
    self.navView.backgroundColor = [UIColor whiteColor];
    //    [_navView setGradientBackgroundWithColors:@[kUIColor(84, 106, 253, 1),kUIColor(46, 193, 255, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(ScaleW(10), ScaleH(2)+kStatusBarHeight, ScaleW(28), ScaleH(38));
    [btn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    btn.imageView.contentMode = UIViewContentModeCenter;
    [btn addTarget:self action:@selector(temaBack) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:btn];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((Size_width-ScaleW(75)-ScaleW(100))/2, kStatusBarHeight+ScaleH(11), ScaleW(100), ScaleH(22))];
    titleLabel.text = @"侧滑控制器";
    titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:ScaleFont(15)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor colorWithHexString:@"#111518"];
    [_navView addSubview:titleLabel];
    [self.view addSubview:_navView];
}

- (void)temaBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
