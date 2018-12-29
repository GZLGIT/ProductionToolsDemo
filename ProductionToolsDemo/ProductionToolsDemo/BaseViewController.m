//
//  BaseViewController.m
//  AIChaperoneBed
//
//  Created by 郭子立 on 2017/7/5.
//  Copyright © 2017年 GZL. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSString *groupId;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self loadBaseSubViews];
    
    
}

- (void)loadBaseSubViews {

    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    if (!_statusBarView)
    {
        _statusBarView =[[UIImageView alloc]init];
        // 先换掉主色调
        ((UIImageView *)_statusBarView).backgroundColor = [UIColor colorWithHexString:@"#fdd000"];
        [self.view addSubview:_statusBarView];
    }
    if (!_navView)
    {
        self.navView = [[UIImageView alloc] init];
        
        self.navView.tag = 1;
        
        ((UIImageView *)_navView).backgroundColor = [UIColor colorWithHexString:@"#fdd000"];
        [self.view insertSubview:_navView belowSubview:_statusBarView];
        _navView.userInteractionEnabled = YES;
        
        _titleLabel =[[UILabel alloc]init];
        _titleLabel.tag = 2;
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_navView addSubview:_titleLabel];
        
        _lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lbtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        _lbtn.tag = 3;
        [_lbtn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_navView addSubview:_lbtn];
        
        _rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _rbtn.tag = 4;
        [_navView addSubview:_rbtn];

    }
    [self configNav];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(configNav) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];

}

- (void)configNav
{
    [_statusBarView setFrame:CGRectMake(0, 0, self.view.frame.size.width, StatusbarSize)];
    [self.navView  setFrame:CGRectMake(0.f, StatusbarSize, Size_width, 44.f)];
    [_lbtn setFrame:CGRectMake(0,0, 50,44)];
    [_rbtn setFrame:CGRectMake(Size_width - 90, 0, 80, 44)];
    [_titleLabel setFrame:CGRectMake(0, (_navView.frame.size.height - 40)/2,Size_width, 40)];
    
}






- (void)clickedCoverBtnAction:(UIButton*)sender {
    
    __weak typeof(self) weakSelf = self;
    UIView *superView = sender.superview;
    UIView *outsideView = [superView.subviews lastObject];
    [UIView animateWithDuration:1 animations:^{
        [outsideView removeFromSuperview];
        [KEYWINDOW addSubview:weakSelf.coverBtn];
    } completion:^(BOOL finished) {
        [weakSelf.coverBtn removeFromSuperview];
        weakSelf.coverBtn = nil;
    }];
    
}


// 阴影
- (UIButton *)coverBtn {
    
    if (!_coverBtn) {
        _coverBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _coverBtn.frame = CGRectMake(0, 0, Size_width, Size_height);
        _coverBtn.backgroundColor = [[UIColor darkTextColor] colorWithAlphaComponent:0.3];
        [_coverBtn addTarget:self action:@selector(clickedCoverBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _coverBtn;
    
}




-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;   //状态栏字体白色 UIStatusBarStyleDefault黑色
}

-(void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)backButtonAction:(UIButton*)sender {

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
