//
//  RequestNewViewController.m
//  ProductionToolsDemo
//
//  Created by 郭子立 on 2018/12/24.
//  Copyright © 2018 龙禧. All rights reserved.
//

#import "RequestNewViewController.h"

@interface RequestNewViewController ()

@end

@implementation RequestNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
}

- (void)loadData {
    
    NSDictionary *dataDic = @{@"username":@"8888", @"password":@"88", @"phonetype":@"IOS", @"identification":@""};
    NSString *dataStr = [[NetWorkManager shareNetWorkManagerTool] dictConversionJsonStrWith:dataDic];
    
    NSMutableDictionary *dataDic1 = @{@"method":@"Login", @"data":dataStr}.mutableCopy;

    NSString *str = [NSString stringWithFormat:@"%@&%@&key=%@", [dataDic1 objectForKey:@"method"], [dataDic1 objectForKey:@"data"], @"ohQk0moiQTbgq5Ag"];
    NSString *md5Str = [NetWorkManager md5OfString:str];
    
    [dataDic1 setObject:md5Str forKey:@"sign"];
    
    [[NetWorkManager shareNetWorkManagerTool] postRequestWithURLStr:@"http://122.112.207.114:9126/wyy/api/Interface/Server" parmaters:dataDic1 successBlock:^(id response) {
        NSLog(@"%@", response);
        if (0 == [[response objectForKey:@"code"] integerValue]) {
            [self addNewViews];
        }
    } failedBlock:^(id response) {
        NSLog(@"%@", response);
    }];
}

- (void)addNewViews {
    /*
    UILabel *lab = [[UILabel alloc] initWithFrame:(CGRectMake(100, 100, 50, 50))];
    lab.text = @"测试";
    [self.view addSubview:lab];
     */
}

- (void)backButtonAction:(UIButton*)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
//    [[NetWorkManager shareNetWorkManagerTool] cancelAllTask];
    
}

- (void)dealloc {
    NSLog(@"销毁");
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
