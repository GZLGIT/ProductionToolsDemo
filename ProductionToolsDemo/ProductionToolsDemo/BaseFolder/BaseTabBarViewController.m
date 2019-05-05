//
//  BaseTabBarViewController.m
//  whereCar
//
//  Created by 郭子立 on 2017/10/28.
//  Copyright © 2017年 ShaoKeXing. All rights reserved.
//

#import "BaseTabBarViewController.h"
/*
#import "HomeWorkViewController.h"
#import "MineViewController.h"
#import "MeaasgesViewController.h"
#import "ContactsMyViewController.h"
#import "BaiDuDeleteViewController.h"
*/


@interface BaseTabBarViewController ()<UITabBarDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setCarCusViewTabBar];
}


- (void)setCarCusViewTabBar {
    
    /*
    // 先去掉消息功能
    [self setupOneChildViewController:[[MeaasgesViewController alloc] init] title:@"消息" image:@"messageHomeDefint" selectedImage:@"messageHome"];
    [self setupOneChildViewController:[[HomeWorkViewController alloc] init] title:@"工作" image:@"homeWorkDefault" selectedImage:@"homeWork"];
    // 先去掉联系人功能
    [self setupOneChildViewController:[[ContactsMyViewController alloc] init] title:@"联系人" image:@"contactsHomeDefint" selectedImage:@"contactsHome"];
    
    [self setupOneChildViewController:[[MineViewController alloc] init] title:@"我的" image:@"mineHomeDefint" selectedImage:@"mineHome"];
    */
    
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@", image]];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectImg = [UIImage imageNamed:[NSString stringWithFormat:@"%@", selectedImage]];
    selectImg = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"%@", title] image:img selectedImage:selectImg];
    
    UIColor *titleColor = RGBA(149, 149, 149, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:titleColor, NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:24], NSFontAttributeName, nil]];
    
    //        UIColor *titleHighlightedColor = [UIColor colorWithRed:0x09/255.0 green:0xbb/255.0 blue:0x07/255.0 alpha:1.0];
    UIColor *titleHighlightedColor = RGBA(255,97,20,1);
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleHighlightedColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    [self addChildViewController:vc];
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
